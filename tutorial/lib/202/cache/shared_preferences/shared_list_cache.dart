import 'package:flutter/material.dart';
import 'package:tutorial/202/cache/shared_preferences/shared_learn_cache.dart';
import 'package:tutorial/202/cache/shared_preferences/shared_manager.dart';
import 'package:tutorial/202/cache/shared_preferences/user_model.dart';
import 'package:tutorial/202/cache/user_cache/user_cache_manager.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({Key? key}) : super(key: key);

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends LoadingStatefull<SharedListCache> {
  late final UserCacheManager userCacheManager;
  late final SharedManager sharedManager;
  List<User>? _users = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializeSharedManager();
  }

  Future<void> initializeSharedManager() async {
    changeLoading();
    sharedManager = SharedManager();
    await sharedManager.init();
    userCacheManager = UserCacheManager(sharedManager: sharedManager);
    _users = userCacheManager.getItems() ?? [];
    changeLoading();
    // changeLoading();
    // sharedManager = SharedManager();
    // await sharedManager.init();
    // userCacheManager = UserCacheManager(sharedManager: sharedManager);

    // changeLoading();
  }

  Future<void> getShared() async {
    _users = userCacheManager.getItems();
    _users ??= [];
    setState(() {});
  }

  Future<void> saveShared() async {
    changeLoading();
    _users = userCacheManager.getItems() ?? [];
    changeLoading();
  }

  Future<void> deleteShared() async {
    changeLoading();
    await userCacheManager.deleteItems();
    setState(() {});
    changeLoading();
  }

  Future<void> _add() async {
    final user = User(
      name: _controller.text,
      url: 'url',
      description: 'description',
    );
    try {
      _users?.add(user);
    } catch (e) {
      //print('___________');
      return;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? const CircularProgressIndicator(color: Colors.white) : const Text('Shared List Cache'),
        actions: isLoading
            ? null
            : [
                IconButton(
                  onPressed: () async {
                    await userCacheManager.saveItems(_users ?? []);
                  },
                  icon: const Icon(Icons.save_as_outlined),
                ),
                IconButton(
                  onPressed: () async {
                    await deleteShared();
                  },
                  icon: const Icon(Icons.remove_outlined),
                ),
                IconButton(
                  onPressed: () async {
                    await getShared();
                  },
                  icon: const Icon(Icons.download_outlined),
                ),
              ],
      ),
      body: Column(
        children: [
          Expanded(child: _UserListView(users: _users ?? [])),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Enter your name',
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await _add();
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

class _UserListView extends StatelessWidget {
  const _UserListView({Key? key, required this.users}) : super(key: key);
  final List<User> users;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text('${users[index].name}'),
            subtitle: Text('${users[index].description}'),
            trailing: Text(
              '${users[index].url}',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    decoration: TextDecoration.underline,
                  ),
            ),
          ),
        );
      },
      itemCount: users.length,
    );
  }
}
