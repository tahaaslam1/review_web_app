import 'dart:async';
import 'dart:convert';

import 'package:review_web_app/data/repositories/auth_repository/auth_repository.dart';

import 'package:http/http.dart' as http;

class ClientAuthRepository extends AuthRepository {
  final _controller = StreamController<AuthenticationStatus>();

  //TODO : token var..

  //User?

  @override
  Future<String> signUp(
    String firstname,
    String lastname,
    String organisation,
    String phone,
    String country,
    String email,
    String password,
  ) async {
    var response = await http.post(
      Uri.parse("http://192.168.1.22:3000/v1/signup"),
      headers: <String, String>{'Content-Type': 'application/json;charset=UTF-8', 'Charset': 'utf-8'},
      body: jsonEncode(
        <String, String>{
          'first_name': firstname,
          'last_name': lastname,
          'email': email,
          'country': country,
          'organisation': organisation,
          'phone': phone,
          'password': password,
          'user_type': "HR",
        },
      ),
    );

    if (response.statusCode != 200) {
      throw Exception('Something went wrong');
    }
    return response.body;
  }

  @override
  Future<void> login(String email, String password) async {
    var response = await http.post(
      Uri.parse("http://192.168.1.22:3000/v1/login"),
      headers: <String, String>{'Content-Type': 'application/json;charset=UTF-8', 'Charset': 'utf-8'},
      body: jsonEncode(
        <String, String>{
          'email': email,
          'password': password,
        },
      ),
    );

    if (response.statusCode != 200) {
      throw Exception('Login Exception');
    }
    _controller.add(AuthenticationStatus.authenticated);

    // return response.body;

    // TODO : token agya....  token save krlia...
  }

  @override
  bool isSignedIn() {
    // TODO: check currenct user -> if response == null return false else return true...
    //TODO : token para wa he ya nahi bs ye check krlou bs... =
    throw UnimplementedError();
  }

  @override
  Stream<AuthenticationStatus> get status async* {
    final signedIn = isSignedIn();
    if (signedIn) {
      _controller.add(AuthenticationStatus.authenticated);
    } else {
      _controller.add(AuthenticationStatus.unauthenticated);
    }
    yield* _controller.stream;
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  void dispose() => _controller.close();
}
