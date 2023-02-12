import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:review_web_app/logger.dart';
import 'package:review_web_app/services/local_storage_helper.dart';
import 'package:review_web_app/services/mobile_storage_service.dart';

class HrRepository {
  Future<dynamic> getHR(String user_id) async {
    String? token;
    if (kIsWeb) {
      token = LocalStorageHelper.getToken('token');

      var response = await http.post(
          Uri.parse("http://192.168.3.150:3000/v1/users/getUser"),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(<String, String>{'user_id': user_id}));
      return response.body;
    } else {
      token = await MobileStorage.getTokenOnMobile('token');
      var response = await http.post(
          Uri.parse("http://192.168.3.150:3000/v1/users/getUser"),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(<String, String>{'user_id': user_id}));
      return response.body;
    }
  }

  Future<dynamic> getHRName(String user_id) async {
    String? token;
    if (kIsWeb) {
      token = LocalStorageHelper.getToken('token');

      var response = await http.post(
          Uri.parse("http://192.168.3.150:3000/v1/users/getHrName"),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(<String, String>{'user_id': user_id}));
      return response.body;
    } else {
      token = await MobileStorage.getTokenOnMobile('token');
      var response = await http.post(
          Uri.parse("http://192.168.3.150:3000/v1/users/getHrName"),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(<String, String>{'user_id': user_id}));
      return response.body;
    }
  }

  Future<dynamic> updateUser(String firstname, String lastname, String phone,
      String country, String organisation, String id) async {
    try {
      String? token;
      if (kIsWeb) {
        token = LocalStorageHelper.getToken('token');
        var response = await http.put(
          Uri.parse("http://192.168.3.150:3000/v1/users/updateUser"),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $token',
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
        return response.body;
      } else {
        token = await MobileStorage.getTokenOnMobile('token');
        var response = await http.put(
          Uri.parse("http://192.168.3.150:3000/v1/users/updateUser"),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $token',
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
        return response.body;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> employeeProfile(
      String firstName,
      String lastName,
      String email,
      String phoneNumber,
      String identity_number,
      String country,
      String submittedBy,
      String submittionTitle,
      String submittionDiscription,
      String submittionReason,
      String organization,
      String user_id,
      String identity_type) async {
    try {
      String? token;
      if (kIsWeb) {
        token = LocalStorageHelper.getToken('token');
        var response = await http.post(
          Uri.parse("http://192.168.3.150:3000/v1/users/insertEmployeeData"),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(<String, String>{
            'identity_type': identity_type,
            'identity_number': identity_number,
            'user_id': user_id,
            'first_name': firstName,
            'last_name': lastName,
            'email': email,
            'organisation': organization,
            'submitted_by': submittedBy,
            'phone': phoneNumber,
            'reason_of_submission': submittionReason,
            'submission_title': submittionTitle,
            'submission_description': submittionDiscription,
          }),
        );
        return response.body;
      } else {
        token = await MobileStorage.getTokenOnMobile('token');
        var response = await http.post(
          Uri.parse("http://192.168.3.150:3000/v1/users/insertEmployeeData"),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(<String, String>{
            'identity_type': identity_type,
            'identity_number': identity_number,
            'user_id': user_id,
            'first_name': firstName,
            'last_name': lastName,
            'email': email,
            'organisation': organization,
            'submitted_by': submittedBy,
            'phone': phoneNumber,
            'reason_of_submission': submittionReason,
            'submission_title': submittionTitle,
            'submission_description': submittionDiscription,
          }),
        );
        return response.body;
      }
    } catch (e) {
      throw (e);
    }
  }

  Future<dynamic> getEmployeeByUserId(String id) async {
    try {
      String? token;
      if (kIsWeb) {
        token = LocalStorageHelper.getToken('token');
        var response = await http.post(
          Uri.parse("http://192.168.3.150:3000/v1/users/getEmployeeByUserId"),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(
            <String, String>{
              'user_id': id,
            },
          ),
        );
        return response.body;
      } else {
        token = await MobileStorage.getTokenOnMobile('token');
        var response = await http.post(
          Uri.parse("http://192.168.3.150:3000/v1/users/getEmployeeByUserId"),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(
            <String, String>{
              'user_id': id,
            },
          ),
        );
        return response.body;
      }
    } catch (e) {
      throw (e);
    }
  }

  Future<dynamic> getEmployee(String id) async {
    try {
      var response = await http.post(
        Uri.parse("http://192.168.3.150:3000/v1/users/getEmployeeById"),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
        body: jsonEncode(
          <String, String>{
            'emp_id': id,
          },
        ),
      );
      return response.body;
    } catch (e) {
      print(e);
    }
  }
}
