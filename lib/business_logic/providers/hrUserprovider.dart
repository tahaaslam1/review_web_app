import 'package:flutter/cupertino.dart';
import 'package:review_web_app/data/repositories/hr_repository/hr_repository.dart';
import 'package:review_web_app/models/employees.dart';
import 'dart:convert';

import 'package:review_web_app/models/hr.dart';

class HrProvider extends ChangeNotifier {
  final HrRepository _hrRepository = HrRepository();
  late HR _hrUser;
  bool hasError = false;
  late Employee _employee;
  HR get hrUser => _hrUser;
  Employee get employeeUser => _employee;

  void updateHRProfile(String firstname, String lastname, String phone,
      String country, String organisation, String id) {
    _hrUser.first_name = firstname;
    _hrUser.last_name = lastname;
    _hrUser.country = country;
    _hrUser.organisation = organisation;
    _hrUser.phone = phone;
    notifyListeners();
  }

  Future<dynamic> trySignup(
      String firstname,
      String lastname,
      String organisation,
      String phone,
      String country,
      String email,
      String password) async {
    hasError = false;
    var response = await _hrRepository.signup(
        firstname, lastname, organisation, phone, country, email, password);
    var decodedData = jsonDecode(response);
    if (decodedData['statusCode'] == 500) {
      hasError = true;
    }
    print("yahan agya hai");
    notifyListeners();
  }

  Future<dynamic> tryLogin(String email, String password) async {
    hasError = false;
    var response = await _hrRepository.login(email, password);
    var decodedData = jsonDecode(response);
    if (decodedData['statusCode'] == 500) {
      hasError = true;
    } else {
      _hrUser = HR.fromJson(decodedData['data'][0]);
      notifyListeners();
    }
  }

  Future<void> UpdateHR(String firstname, String lastname, String phone,
      String country, String organisation, String id) async {
    var response = await _hrRepository.updateUser(
        firstname, lastname, phone, country, organisation, id);
    updateHRProfile(firstname, lastname, phone, country, organisation, id);
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
    var response = await _hrRepository.employeeProfile(
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

    notifyListeners();
  }

   Future<dynamic> GetUser(String id) async {
    var response = await _hrRepository.getUser(id);
     var decodedData = jsonDecode(response.body);
      _employee = Employee.fromJson(decodedData['data'][0]);
    notifyListeners();
  }

}
