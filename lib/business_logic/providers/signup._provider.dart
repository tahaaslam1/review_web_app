import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../data/repositories/auth_repository/server_auth_repository.dart';
import '../../logger.dart';

class SignupProvider extends ChangeNotifier {
  ServerAuthRepository _authRepository;

  SignupProvider({
    required authenRepository,
  }) : _authRepository = authenRepository;

  bool _hasError = false;

  bool get hasError => _hasError;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<void> trySignup(
    String firstname,
    String lastname,
    String organisation,
    String phone,
    String country,
    String email,
    String password,
  ) async {
    _hasError = false;
    var response = await _authRepository.signUp(
        firstname, lastname, organisation, phone, country, email, password);
    var decodedData = jsonDecode(response);

    if (decodedData['statusCode'] == 500) {
      _hasError = true;
      _errorMessage = 'Email already registered';
      notifyListeners();
    } else if (decodedData['data']['msg'] == 'success') {
      _hasError = false;
      notifyListeners();
      return;
    } else {
      _hasError = true;
      notifyListeners();
      _errorMessage = decodedData['data']['msg'];
    }
  }
}
