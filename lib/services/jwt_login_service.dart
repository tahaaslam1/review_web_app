import 'package:review_web_app/services/local_storage_helper.dart';
import 'package:review_web_app/services/mobile_storage.dart';

class JwtLoginService{
  
  void loginWeb() async {
    // if (userName.text.isNotEmpty && password.text.isNotEmpty) {
    //   var responce =
    //       await http.post(Uri.parse('api jo hit hogi uska path ayga'),
    //           body: ({
    //             "email": userName,
    //             "password": password,
    //           }));
    //   if (responce.statusCode == 200) {
    //     final body = jsonDecode(responce.body);
    //     pageRoute(body['token']);
    //   }
    // }
    pageRouteWeb('qwertuiopasdfghjklzxcvbnm');
  }

  void pageRouteWeb(String token) async {
    print(token);
    LocalStorageHelper.saveToken('key', token);
  }


    void loginMobile() async {
    // if (userName.text.isNotEmpty && password.text.isNotEmpty) {
    //   var responce =
    //       await http.post(Uri.parse('api jo hit hogi uska path ayga'),
    //           body: ({
    //             "email": userName,
    //             "password": password,
    //           }));
    //   if (responce.statusCode == 200) {
    //     final body = jsonDecode(responce.body);
    //     pageRoute(body['token']);
    //   }
    // }
    pageRouteMobile('qwertuiopasdfghjklzxcvbnm');
  }


  void pageRouteMobile(String token) async {
    print(token);
    MobileStorage.storeTokenOnMobile(token);
  }
}
