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
  List<User> _users = [];
  @override
  void initState() {
    super.initState();
    initializeAndSave();
  }

  Future<void> initializeAndSave() async {
    changeLoading();
    final SharedManager sharedManager = SharedManager();
    await sharedManager.init();
    userCacheManager = UserCacheManager(sharedManager: sharedManager);
    _users = userCacheManager.getItems() ?? [];
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? CircularProgressIndicator(color: Colors.white) : Text('Shared List Cache'),
        actions: isLoading
            ? null
            : [
                IconButton(
                  onPressed: () {
                    changeLoading();
                    userCacheManager.saveItems(_users);
                    changeLoading();
                  },
                  icon: const Icon(Icons.download_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_outlined),
                ),
              ],
      ),
      body: _UserListView(users: _users),
    );
  }
}

class _UserListView extends StatelessWidget {
  _UserListView({Key? key, required this.users}) : super(key: key);
  final List<User> users;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text('${users[index].name}'),
            subtitle: Text('${users[index].description}'),
            trailing: Text('${users[index].url}',
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      decoration: TextDecoration.underline,
                    )),
          ),
        );
      },
      itemCount: users.length,
    );
  }
}
