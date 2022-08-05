import 'package:flutter/material.dart';
import 'package:tutorial/202/cache/shared_preferences/shared_manager.dart';
import 'package:tutorial/202/cache/shared_preferences/user_model.dart';

class SharedLearnView extends StatefulWidget {
  const SharedLearnView({Key? key}) : super(key: key);

  @override
  State<SharedLearnView> createState() => _SharedLearnViewState();
}

class _SharedLearnViewState extends LoadingStatefull<SharedLearnView> {
  final String title = 'Shared Learn View';
  int _currentValue = 0;
  late final SharedManager _manager;
  late final List<User> userItems;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    userItems = UserItems().users;
    _initialize();
  }

  Future<void> _initialize() async {
    changeLoading();
    await _manager.init();
    changeLoading();
    getDefaultValue();
  }

  void getDefaultValue() async {
    // final prefs = await SharedPreferences.getInstance();
    // final int? counter = prefs.getInt('counter');
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '0');
  }

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString() + ' ' + title),
        actions: _isLoading(context),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangeValue(value);
            },
          ),
          Expanded(
            child: _UserListView(),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          _removeValueButton(),
        ],
      ),
    );
  }

  List<Widget> _isLoading(BuildContext context) {
    return [
      isLoading
          ? CircularProgressIndicator(
              color: Theme.of(context).scaffoldBackgroundColor,
            )
          : const SizedBox.shrink(),
    ];
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.save),
      onPressed: () async {
        changeLoading();
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading();
      },
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.remove),
      onPressed: () async {
        changeLoading();
        await _manager.removeItem(SharedKeys.counter);
        changeLoading();
      },
    );
  }
}

class _UserListView extends StatelessWidget {
  _UserListView({
    Key? key,
  }) : super(key: key);
  final List<User> users = UserItems().users;
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

// Generic
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}

class UserItems {
  late final List<User> users;
  UserItems() {
    users = [
      User(name: 'Gökhan', description: 'Gökhan', url: 'sgb.com'),
      User(name: 'Gökhan1', description: 'Gökhan', url: 'sgb.com'),
      User(name: 'Gökhan2', description: 'Gökhan', url: 'sgb.com'),
    ];
  }
}
