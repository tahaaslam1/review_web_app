import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:review_web_app/business_logic/providers/auth_provider.dart';
import 'package:review_web_app/data/repositories/auth_repository/auth_repository.dart';

import 'package:http/http.dart' as http;
import 'package:review_web_app/logger.dart';
import 'package:review_web_app/models/user.dart';
import 'package:review_web_app/services/jwt_service.dart';
import 'package:review_web_app/services/local_storage_helper.dart';
import 'package:review_web_app/services/mobile_storage_service.dart';

class ServerAuthRepository extends AuthRepository {
  final _controller = StreamController<AuthenticationStatus>();
//void set setController(controller) => this._controller = controller;

  StreamController<AuthenticationStatus> get controller => _controller;

  //TODO : token var..

  //User?

  @override
  Future<dynamic> signUp(
    String firstname,
    String lastname,
    String organisation,
    String phone,
    String country,
    String email,
    String password,
  ) async {
    var response = await http.post(
      Uri.parse("http://192.168.3.150:3000/v1/signup"),
      headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
        'Accept': '/',
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      },
      body: jsonEncode(
        <String, dynamic>{
          'first_name': firstname,
          'last_name': lastname,
          'email': email,
          'country': country,
          'organisation': organisation,
          'phone': phone,
          'password': password,
          'user_type': 2,
        },
      ),
    );

    if (response.body.isNotEmpty) {
      logger.d(jsonDecode(response.body));
    }

    // logger.d(json.decode(response.body));
    return response.body;
  }

  @override
  Future<String> login(String email, String password) async {
    var response = await http.post(
      Uri.parse("http://192.168.3.150:3000/v1/login"),
      headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
        'Accept': '/',
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      },
      body: jsonEncode(
        <String, String>{
          'email': email,
          'password': password,
        },
      ),
    );

    if (response.statusCode != 200) {
      throw Exception('Login Exception');
    } else {
      return response.body;
    }
  }
  //TODO: save token in local storage and  _controller.add(AuthenticationStatus.authenticated);

  // return response.body;

  Future<User> getCurrentUser({required userId}) async {
    User user;
    var response = await http.post(
      Uri.parse("http://192.168.3.150:3000/v1/login"),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      },
      body: jsonEncode(
        <String, String>{
          'user_id': userId,
        },
      ),
    );

    final decodedData = json.decode(response.body);

    user = User.fromJson(decodedData);

    return user;
  }

  @override
  Future<bool> isSignedIn() async {
    if (kIsWeb) {
      final token = LocalStorageHelper.getToken('token');
      logger.i(token);
      if (token != null) {
        return true;
      } else {
        return false;
      }
    } else {
      final token = await MobileStorage.getTokenOnMobile('token');
      if (token != null) {
        return true;
      } else {
        return true;
      }
    }

    // TODO: check currenct user -> if response == null return false else return true...
    //TODO : token para wa he ya nahi bs ye check krlou bs... =
    // throw UnimplementedError();

    //TODO : check user type if guest return false else return true
  }

  @override
  Stream<AuthenticationStatus> get status async* {
    // final signedIn = await isSignedIn();
    // if (signedIn) {
    //   _controller.add(AuthenticationStatus.authenticated);
    // } else {
    //   _controller.add(AuthenticationStatus.unauthenticated);
    // }
    _controller.add(AuthenticationStatus.unauthenticated);

    yield* _controller.stream;
  }

  @override
  void signOut() async {
    LocalStorageHelper.clearAll();
    // TODO: implement signOut
    //TODO : remove token from local storage and _controller.add(AuthenticationStatus.unauthenticated)
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  @override
  void dispose() => _controller.close();
}
