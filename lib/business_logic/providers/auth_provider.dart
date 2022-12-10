import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:review_web_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:review_web_app/models/user.dart';

class AuthProvider extends ChangeNotifier {
  //TODO :auth repo lelo in params of constructor..
  final AuthRepository _authenticationRepository;

  final bool _isLoading = false;

  late StreamSubscription<AuthenticationStatus> _authenticationStatusSubscription;

  User _user = User(email: '-', firstName: '-', lastName: '-', userId: '-', userType: UserType.guest);

  AuthenticationStatus _status = AuthenticationStatus.authenticated;

  AuthProvider({
    required AuthRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository {
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) {
        _status = status;
        notifyListeners();
      },
    );
  }

  Future<void> onAuthenticationStatusChanged() async {
    switch (_status) {
      case AuthenticationStatus.unauthenticated:
        _status = AuthenticationStatus.unauthenticated;
        notifyListeners();
        break;
      case AuthenticationStatus.authenticated:
        final user = await tryGetUser();
        if (user != null) {
          _user = user;
          notifyListeners();
        } else {
          _status = AuthenticationStatus.unauthenticated;
          notifyListeners();
        }
        break;
      default:
        _status = AuthenticationStatus.unknown;
        notifyListeners();
    }
  }

  bool get isLoading => _isLoading;

  AuthenticationStatus get status => _status;

  User get user => _user;

  Future<User?> tryGetUser() async {
    try {
     // final user
      return null;
    } catch (error) {
      throw Exception(error);
    }
  }
}
