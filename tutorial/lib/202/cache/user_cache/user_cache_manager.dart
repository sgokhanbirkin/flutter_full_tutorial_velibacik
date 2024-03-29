import 'dart:convert';

import 'package:tutorial/202/cache/shared_preferences/shared_manager.dart';
import 'package:tutorial/202/cache/shared_preferences/user_model.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager({
    required this.sharedManager,
  });

  Future<void> saveItems(List<User> items) async {
    final _items = items.map((element) => jsonEncode(element)).toList();
    await sharedManager.saveStringItems(SharedKeys.users, _items);
  }

  List<User>? getItems() {
    final itemsString = sharedManager.getStringList(SharedKeys.users);
    if (itemsString?.isNotEmpty ?? false) {
      return itemsString!.map((element) {
        final json = jsonDecode(element);
        if (json is Map<String, dynamic>) {
          return User.fromJson(json);
        }
        return User(name: 'name', url: 'url', description: 'description');
      }).toList();
    }
    return null;
  }

  Future<void> deleteItems() async {
    await sharedManager.removeItem(SharedKeys.users);
  }
}
