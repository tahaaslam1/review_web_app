import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:review_web_app/services/local_storage_helper.dart';
import 'package:universal_html/js_util.dart';

import '../../../services/mobile_storage_service.dart';

class AdminRepo {
  Future<dynamic> getEmployees() async {
    try {
      String? token;
      if (kIsWeb) {
        token = LocalStorageHelper.getToken('token');

        var response = await http.get(
          Uri.parse("http://192.168.3.150:3000/v1/admin/getAllEmployees"),
          headers: <String, String>{
            "Access-Control-Allow-Origin": "*",
            'Accept': '/',
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $token',
          },
        );
        return response;
      } else {
        token = await MobileStorage.getTokenOnMobile('token');

        var response = await http.get(
          Uri.parse("http://192.168.3.150:3000/v1/admin/getAllEmployees"),
          headers: <String, String>{
            "Access-Control-Allow-Origin": "*",
            'Accept': '/',
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $token',
          },
        );
        return response;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getHR() async {
    try {
      String? token;

      if (kIsWeb) {
        token = LocalStorageHelper.getToken('token');
        var response = await http.get(
          Uri.parse("http://192.168.3.150:3000/v1/admin/getAllUsers"),
          headers: <String, String>{
            "Access-Control-Allow-Origin": "*",
            'Accept': '/',
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $token',
          },
        );
        return response;
      } else {
        token = await MobileStorage.getTokenOnMobile('token');
        var response = await http.get(
          Uri.parse("http://192.168.3.150:3000/v1/admin/getAllUsers"),
          headers: <String, String>{
            "Access-Control-Allow-Origin": "*",
            'Accept': '/',
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $token',
          },
        );
        return response;
      }
    } catch (e) {
      throw (e);
    }
  }

  Future<dynamic> getUnapprovedUsers() async {
    try {
      String? token;
      if (kIsWeb) {
        token = LocalStorageHelper.getToken('token');
        var response = await http.get(
          Uri.parse("http://192.168.3.150:3000/v1/admin/getUnapprovedUsers"),
          headers: <String, String>{
            "Access-Control-Allow-Origin": "*",
            'Accept': '/',
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $token',
          },
        );
        return response;
      } else {
        token = await MobileStorage.getTokenOnMobile('token');
        var response = await http.get(
          Uri.parse("http://192.168.3.150:3000/v1/admin/getUnapprovedUsers"),
          headers: <String, String>{
            "Access-Control-Allow-Origin": "*",
            'Accept': '/',
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $token',
          },
        );
        return response;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> acceptUser(String id, String admin_id) async {
    try {
      String? token;
      if (kIsWeb) {
        token = LocalStorageHelper.getToken('token');

        var response = await http.put(
          Uri.parse("http://192.168.3.150:3000/v1/admin/acceptUser"),
          headers: <String, String>{
            "Access-Control-Allow-Origin": "*",
            'Accept': '/',
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(
            <String, String>{'user_id': id, 'admin_id': admin_id},
          ),
        );
        return response;
      } else {
        token = await MobileStorage.getTokenOnMobile('token');

        var response = await http.put(
          Uri.parse("http://192.168.3.150:3000/v1/admin/acceptUser"),
          headers: <String, String>{
            "Access-Control-Allow-Origin": "*",
            'Accept': '/',
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(
            <String, String>{'user_id': id, 'admin_id': admin_id},
          ),
        );
        return response;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getUserProfile(String id) async {
    try {
      String? token;
      if (kIsWeb) {
        token = LocalStorageHelper.getToken('token');
        var response = await http.post(
            Uri.parse("http://192.168.3.150:3000/v1/admin/acceptUser"),
            headers: <String, String>{
              "Access-Control-Allow-Origin": "*",
              'Accept': '/',
              'Content-Type': 'application/json;charset=UTF-8',
              'Charset': 'utf-8',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode(<String, String>{
              'user_id': id,
            }));
        return response;
      } else {
        token = await MobileStorage.getTokenOnMobile('token');

        var response = await http.post(
            Uri.parse("http://192.168.3.150:3000/v1/admin/acceptUser"),
            headers: <String, String>{
              "Access-Control-Allow-Origin": "*",
              'Accept': '/',
              'Content-Type': 'application/json;charset=UTF-8',
              'Charset': 'utf-8',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode(<String, String>{
              'user_id': id,
            }));
        return response;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> rejectUser(String id) async {
    try {
      String? token;
      if (kIsWeb) {
        token = LocalStorageHelper.getToken('token');
        var response = await http.delete(
            Uri.parse("http://192.168.3.150:3000/v1/admin/deleteUser"),
            headers: <String, String>{
              "Access-Control-Allow-Origin": "*",
              'Accept': '/',
              'Content-Type': 'application/json;charset=UTF-8',
              'Charset': 'utf-8',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode(<String, String>{
              'user_id': id,
            }));
        return response;
      } else {
        token = await MobileStorage.getTokenOnMobile('token');
        var response = await http.delete(
            Uri.parse("http://192.168.3.150:3000/v1/admin/deleteUser"),
            headers: <String, String>{
              "Access-Control-Allow-Origin": "*",
              'Accept': '/',
              'Content-Type': 'application/json;charset=UTF-8',
              'Charset': 'utf-8',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode(<String, String>{
              'user_id': id,
            }));
        return response;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> updateUser(String firstname, String lastname, String phone,
      String country, String organisation, String? id) async {
    try {
      String? token;
      if (kIsWeb) {
        token = LocalStorageHelper.getToken('token');
        var response = await http.put(
          Uri.parse("http://192.168.3.150:3000/v1/admin/users/updateUser"),
          headers: <String, String>{
            "Access-Control-Allow-Origin": "*",
            'Accept': '/',
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(<String, String>{
            'user_id': id ?? '',
            'first_name': firstname,
            'last_name': lastname,
            'country': country,
            'organisation': organisation,
            'phone': phone
          }),
        );
        return response;
      } else {
        token = await MobileStorage.getTokenOnMobile('token');
        var response = await http.put(
          Uri.parse("http://192.168.3.150:3000/v1/admin/users/updateUser"),
          headers: <String, String>{
            "Access-Control-Allow-Origin": "*",
            'Accept': '/',
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(<String, String>{
            'user_id': id ?? '',
            'first_name': firstname,
            'last_name': lastname,
            'country': country,
            'organisation': organisation,
            'phone': phone
          }),
        );
        return response;
      }
    } catch (e) {
      throw (e);
    }
  }
}
