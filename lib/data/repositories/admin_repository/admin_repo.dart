import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminRepo {
  Future<dynamic> getEmployees() async {
    try {
      var response = await http.get(
        Uri.parse("http://192.168.1.22:3000/v1/admin/getAllEmployees"),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
      );
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getHR() async {
    try {
      var response = await http.get(
        Uri.parse("http://192.168.1.22:3000/v1/admin/getAllUsers"),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
      );
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getUnapprovedUsers() async {
    try {
      var response = await http.get(
        Uri.parse("http://192.168.1.22:3000/v1/admin/getUnapprovedUsers"),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
      );
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> acceptUser(String id) async {
    try {
      var response = await http.put(
          Uri.parse("http://192.168.1.22:3000/v1/admin/acceptUser"),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8'
          },
          body: jsonEncode(<String, String>{
            'user_id': id,
          }));
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getUserProfile(String id) async {
    try {
      var response = await http.post(
          Uri.parse("http://192.168.1.22:3000/v1/admin/acceptUser"),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8'
          },
          body: jsonEncode(<String, String>{
            'user_id': id,
          }));
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> rejectUser(String id) async {
    try {
      var response = await http.delete(
          Uri.parse("http://192.168.1.22:3000/v1/admin/deleteUser"),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8'
          },
          body: jsonEncode(<String, String>{
            'user_id': id,
          }));
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> updateUser(String firstname, String lastname, String phone,
      String country, String organisation, String id) async {
    try {
      var response = await http.put(
        Uri.parse("http://192.168.1.22:3000/v1/admin/users/updateUser"),
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
}
