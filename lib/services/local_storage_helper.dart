import 'package:universal_html/html.dart';

class LocalStorageHelper {
  static Storage localStorage = window.localStorage;

  static void saveToken(String key, String value) {
    localStorage[key] = value;
  }

  static String? getToken(String key) {
    return localStorage[key];
  }

  static void removeToken(String key) {
    localStorage.remove(key);
  }

  static void clearAll() {  //TODO call on sign-out
    localStorage.clear();
  }
}
