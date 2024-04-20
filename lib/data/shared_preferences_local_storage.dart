import 'package:shared_preferences/shared_preferences.dart';

import 'interfaces/local_storage_interface.dart';

class SharedPreferencesLocalStorage extends ILocalStorage {
  
  @override
  Future get(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.get(key);
  }

  @override
  Future put(String key, value) async {
    final preferences = await SharedPreferences.getInstance();
    if (value is String) {
      preferences.setString(key, value);
    }
  }

  @override
  Future delete(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.remove(key);
  }
}