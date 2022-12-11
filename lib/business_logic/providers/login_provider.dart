import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/auth_provider.dart';
import 'package:review_web_app/models/user.dart';

import '../../data/repositories/auth_repository/auth_repository.dart';
import '../../data/repositories/auth_repository/server_auth_repository.dart';
import '../../logger.dart';
import '../../services/local_storage_helper.dart';
import '../../services/mobile_storage_service.dart';

class LoginProvider extends ChangeNotifier {
  final ServerAuthRepository _authRepository;

  final AuthProvider _authProvider;
  LoginProvider({required authenRepository, required authProvider})
      : _authRepository = authenRepository,
        _authProvider = authProvider;
  bool hasError = false;
  Future<String?> tryLogin(String email, String password) async {
    hasError = false;
    final response = await _authRepository.login(email, password);
    final decodedData = json.decode(response);

    Map<String, dynamic> data = decodedData['data'];

    if (data.containsKey('msg')) {
      return decodedData['data']['msg'];
    } else {
      Map<String, dynamic> decodedToken =
          JwtDecoder.decode(decodedData['data']['token']);

      if (decodedToken["user_type"] == 1) {
        if (kIsWeb) {
          LocalStorageHelper.saveToken('token', decodedData['data']['token']);

          await _authProvider.setUser(User.fromJson(decodedToken));
          _authRepository.controller.add(AuthenticationStatus.authenticated);
        } else {
          MobileStorage.storeTokenOnMobile(
              key: 'token', token: decodedData['data']['token']);

          await _authProvider.setUser(User.fromJson(decodedToken));
          _authRepository.controller.add(AuthenticationStatus.authenticated);
        }
      } else {
        if (kIsWeb) {
          LocalStorageHelper.saveToken('token', decodedData['data']['token']);

          await _authProvider.setUser(User.fromJson(decodedToken));
          _authRepository.controller.add(AuthenticationStatus.authenticated);
        } else {
          MobileStorage.storeTokenOnMobile(
              key: 'token', token: decodedData['data']['token']);
          await _authProvider.setUser(User.fromJson(decodedToken));
          _authRepository.controller.add(AuthenticationStatus.authenticated);
        }
      }

      return '';
      // if (decodedData['isApproved'] == "true") {
      //   logger.i('here');

      // } else {
      //   _authRepository.controller.add(AuthenticationStatus.unauthenticated);
      //   return "User Not Approved";
      // }
    }
  }
}
