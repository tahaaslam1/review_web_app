import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MobileStorage {
  static const mobileStorage = FlutterSecureStorage();

  static void storeTokenOnMobile({required key, required token}) async {
    await mobileStorage.write(key: key, value: token);
  }

  static Future<String?> getTokenOnMobile() {
    return mobileStorage.read(key: 'key');
  }

  static void removeTokenFromMobile() {   //TODO : call after signout 
    mobileStorage.deleteAll();
  }
}
