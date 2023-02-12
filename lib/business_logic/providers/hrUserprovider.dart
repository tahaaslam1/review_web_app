import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/auth_provider.dart';
import 'package:review_web_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:review_web_app/data/repositories/hr_repository/hr_repository.dart';
import 'package:review_web_app/models/employees.dart';
import 'dart:convert';

import 'package:review_web_app/models/hr.dart';
import 'package:review_web_app/models/user.dart';
import 'package:universal_html/js.dart';

import '../../data/repositories/auth_repository/server_auth_repository.dart';
import '../../logger.dart';

class HrProvider extends ChangeNotifier {
  final HrRepository _hrRepository = HrRepository();

  // final AuthProvider _authProvider;

  // HrProvider({required authProvider}) : _authProvider = authProvider;

  late String _errorMessage;
  bool _hasError = false;
  bool isLoading = false;
  late Employee _employee;

  bool get hasError => _hasError;
  String get errorMessage => _errorMessage;

  List<Employee> _allEmp = [];
  HR _hr = HR(
    email: '-',
    firstName: '-',
    lastName: '-',
    userId: '-',
    userType: UserType.hr,
    isApproved: true,
  );
  HR get hr => _hr;

  List<Employee> get allEmp => _allEmp;
  Employee get employeeUser => _employee;

  void reInitialize() {
    _hasError = false;
    _errorMessage = '';
    notifyListeners();
  }

  Future<void> getHR(String id) async {
    isLoading = true;

    try {
      var response = await _hrRepository.getHR(id);
      var decodedData = jsonDecode(response);

      if (decodedData['statusCode'] == 500) {
        _hasError = true;
        _errorMessage = decodedData['message'];

        notifyListeners();
      } else {
        _hr = HR.fromJson(decodedData['data'][0]);
      }
    } catch (error) {
      _hasError = true;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> getHRName(String id) async {
    isLoading = true;

    try {
      var response = await _hrRepository.getHRName(id);
      var decodedData = jsonDecode(response);

      if (decodedData['statusCode'] == 500) {
        _hasError = true;
        _errorMessage = decodedData['message'];
        notifyListeners();
      } else {
        _hr = HR.fromJson(decodedData['data'][0]);
      }
    } catch (error) {
      _hasError = true;
    }
    isLoading = false;
    notifyListeners();
  }

  void updateHRProfile(String firstname, String lastname, String phone,
      String country, String organisation) {
    _hr.firstName = firstname;
    _hr.lastName = lastname;
    _hr.country = country;
    _hr.phone = phone;
    _hr.organisation = organisation;
    notifyListeners();
  }

  Future<void> UpdateHR(String firstname, String lastname, String phone,
      String country, String organisation, String id) async {
    try {
      var response = await _hrRepository.updateUser(
          firstname, lastname, phone, country, organisation, id);
      var decodedData = jsonDecode(response);

      if (decodedData['statusCode'] == 500) {
        _hasError = true;
        _errorMessage = decodedData['message'];
        notifyListeners();
      } else {
        updateHRProfile(firstname, lastname, phone, country, organisation);
      }
    } catch (error) {
      _hasError = true;
    }
    notifyListeners();
  }

  Future<void> SubmitEmployeeProfile(
      String firstName,
      String lastName,
      String email,
      String phoneNumber,
      String nicPassport,
      String country,
      String submittedBy,
      String submittionTitle,
      String submittionDiscription,
      String submittionReason,
      String organization,
      String user_id,
      String identity_type) async {
    try {
      final response = await _hrRepository.employeeProfile(
          firstName,
          lastName,
          email,
          phoneNumber,
          nicPassport,
          country,
          submittedBy,
          submittionTitle,
          submittionDiscription,
          submittionReason,
          organization,
          user_id,
          identity_type);

      var decodedData = jsonDecode(response);

      if (decodedData['statusCode'] == 500) {
        _hasError = true;
        _errorMessage = decodedData['message'];
        notifyListeners();
      }
    } catch (error) {
      _hasError = true;
    }

    notifyListeners();
  }

  Future<dynamic> GetEmployee(String id) async {
    isLoading = true;

    try {
      var response = await _hrRepository.getEmployee(id);
      var decodedData = jsonDecode(response);

      if (decodedData['statusCode'] == 500) {
        _hasError = true;
        _errorMessage = decodedData['message'];
        notifyListeners();
      } else {
        _employee = Employee.fromJson(decodedData['data'][0]);
      }
    } catch (error) {
      _hasError = false;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<dynamic> getEmployeeByUserId(String user_id) async {
    _allEmp = [];
    isLoading = true;
    try {
      var response = await _hrRepository.getEmployeeByUserId(user_id);
      var decodedData = jsonDecode(response);

      if (decodedData['statusCode'] == 500) {
        _hasError = true;
        _errorMessage = decodedData['message'];
        notifyListeners();
      } else {
        for (var m in decodedData['data']) {
          allEmp.add(Employee.fromJson(m));
        }
      }
    } catch (error) {
      _hasError = true;
    }

    isLoading = false;
    notifyListeners();
  }
}
