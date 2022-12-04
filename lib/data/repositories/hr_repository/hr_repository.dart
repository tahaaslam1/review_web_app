import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HrRepository {
  Future<dynamic> signup(String firstname, String lastname, String organisation,
      String phone, String country, String email, String password) async {
    var response = await http.post(
      Uri.parse("http://192.168.3.150:3000/v1/signup"),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      },
      body: jsonEncode(
        <String, String>{
          'first_name': firstname,
          'last_name': lastname,
          'email': email,
          'country': country,
          'organisation': organisation,
          'phone': phone,
          'password': password,
          'type_id': "1",
        },
      ),
    );
    return response.body;
  }


  Future<dynamic> login(String email, String password) async {
    var response = await http.post(
      Uri.parse("http://192.168.3.150:3000/v1/login"),
      headers: <String, String>{
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
    return response.body;
    }
  Future<dynamic> updateUser(String firstname, String lastname, String phone,
      String country, String organisation, String id) async {
    try {
      var response = await http.put(
        Uri.parse("http://192.168.3.150:3000/v1/users/updateUser"),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
        body: jsonEncode(<String, String>{
          'user_id': id,
          'first_name': firstname,
          'last_name': lastname,
          'country': country,
          'organisation': organisation,
          'phone': phone
        }),
      );
      return response;
    } catch (e) {
      print(e);
    }
}
