import 'package:review_web_app/services/local_storage_helper.dart';
import 'package:review_web_app/services/mobile_storage_service.dart';

class JwtLoginService {
  void pageRouteWeb(String token) async {
    print(token);
    LocalStorageHelper.saveToken('key', token);
  }

  void pageRouteMobile(String token) async {
    print(token);
    MobileStorage.storeTokenOnMobile(key: 'token', token: token);
  }
}
