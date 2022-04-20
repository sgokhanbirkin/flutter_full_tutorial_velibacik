import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/202/cache/shared_preferences/shared_not_initiazle.dart';

enum SharedKeys { counter, users }

class SharedManager {
  SharedPreferences? preferences;

  SharedManager();

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPreferences() {
    if (preferences == null) throw SharedNotInitiazleException();
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkPreferences();
    await preferences?.setString(key.name, value);
  }

  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    _checkPreferences();
    await preferences?.setStringList(key.name, value);
  }

  String? getString(SharedKeys key) {
    _checkPreferences();
    return preferences?.getString(key.name);
  }

  List<String>? getStringList(SharedKeys key) {
    _checkPreferences();
    return preferences?.getStringList(key.name);
  }

  Future<void> removeItem(SharedKeys key) async {
    _checkPreferences();
    await preferences?.remove(key.name);
  }
}
