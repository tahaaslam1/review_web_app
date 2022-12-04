import 'dart:convert';

import 'package:review_web_app/logger.dart';
import 'package:review_web_app/models/employees.dart';
import 'package:http/http.dart' as http;

class EmployeesRepository {
  Future<List<Employee>> getSearchedEmployees({required String? value}) async {
    List<Employee> emps = [];

    final response = await http.get(
      Uri.parse(
        'http://192.168.1.22:3000/v1/SearchUsers/$value',
      ),
      headers: {'content-type': 'application/json'},
    );

    if (response.statusCode != 200) {
      final data = json.decode(response.body);
      throw Exception(data['data']['error']);
    } else {
      Map<String, dynamic> data = json.decode(response.body);

      emps =
          data['data'].map<Employee>((emp) => Employee.fromJson(emp)).toList();

      return emps;
    }
  }
}
