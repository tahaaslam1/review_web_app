import 'package:flutter/cupertino.dart';
import 'package:review_web_app/logger.dart';

enum Pages { login, signup, landing }

class UnAuthWrapperProvider extends ChangeNotifier {
  Pages _page = Pages.landing;

  Pages get page => _page;

  void navigateToLandingPage() {
    logger.d('heelo');
    _page = Pages.landing;
    notifyListeners();
  }

  void navigateToLoginPage() {
    _page = Pages.login;
    notifyListeners();
  }

  void navigateToSignUpPage() {
    _page = Pages.signup;
    notifyListeners();
  }
}
