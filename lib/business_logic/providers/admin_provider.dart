import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:review_web_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:review_web_app/logger.dart';
import 'package:review_web_app/models/employees.dart';
import 'package:review_web_app/models/hr.dart';

import '../../data/repositories/admin_repository/admin_repo.dart';

class AdminProvider extends ChangeNotifier {
  AuthRepository _authRepository;

  
  AdminProvider({required authRepository}) : _authRepository = authRepository;

  List<HR> _allHR = [];
  List<Employee> _allEmployees = [];
  List<HR> _allUnapproved = [];

  String _value = "USERS TABLE";
  bool _usertable = true;
  bool _isLoading = false;
  String get value => _value;
  bool get tabletype => _usertable;
  bool get loading => _isLoading;
  set value(val) => {_value = val};
  set tabletype(val) => {_usertable = val};

  List<HR> get allHR => _allHR;
  List<HR> get allUnapproved => _allUnapproved;
  List<Employee> get allEmployees => _allEmployees;

  void removeHR(String id) {
    _allUnapproved.removeWhere((element) => element.userId == id);
    notifyListeners();
  }

  void deleteHR(String id) {
    _allHR.removeWhere((element) => element.userId == id);
    notifyListeners();
  }

  HR getProfile(String id) {
    return _allUnapproved.firstWhere((element) => element.userId == id);
  }

  HR getUserProfile(String id) {
    HR a = _allHR.firstWhere((element) => element.userId == id);

    return a;
  }

  void updateUserProfile(String firstname, String lastname, String phone, String country, String organisation, String id) {
    for (int i = 0; i < _allHR.length; ++i) {
      if (_allHR[i].userId == id) {
        _allHR[i].firstName = firstname;
        _allHR[i].lastName = lastname;
        _allHR[i].country = country;
        _allHR[i].organisation = organisation;
        _allHR[i].phone = phone;
      }
    }

    notifyListeners();
  }

  void updateUserProfileStatus(String id) {
    for (int i = 0; i < _allHR.length; ++i) {
      if (_allHR[i].userId == id) {
        _allHR[i].isApproved = true;
      }
    }
    notifyListeners();
  }

  AdminRepo adminRepository = AdminRepo();
  Future<void> GetAllUsers() async {
    _isLoading = true;
    var response = await adminRepository.getEmployees();
    var decodedData = jsonDecode(response.body);
    for (var m in decodedData['data']) {
      allEmployees.add(Employee.fromJson(m));
    }
    var res1 = await adminRepository.getHR();
    var decodedData1 = jsonDecode(res1.body);

    for (var m in decodedData1['data']) {
      allHR.add(HR.fromJson(m));
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> GetUnapprovedUsers() async {
    _allUnapproved = [];
    _isLoading = true;

    var response = await adminRepository.getUnapprovedUsers();
    var decodedData = jsonDecode(response.body);

    for (var m in decodedData['data']) {
      allUnapproved.add(HR.fromJson(m));
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> AcceptUser(
    String id,
  ) async {
    var response = await adminRepository.acceptUser(id);
    updateUserProfileStatus(id);
    removeHR(id);
    notifyListeners();
  }

  Future<void> GetUserProfile(String id) async {
    _isLoading = true;
    var response = await adminRepository.getUserProfile(id);
    var decodedData = jsonDecode(response.body);

    // builders = Builder1.fromJson(decodedData);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> RejectUser(String id) async {
    var response = await adminRepository.rejectUser(id);
    removeHR(id);
    _allHR.removeWhere((element) => element.userId == id);

    notifyListeners();
  }

  Future<void> DeleteUser(String id) async {
    var response = await adminRepository.rejectUser(id);
    deleteHR(id);

    notifyListeners();
  }

  Future<void> UpdateHR(String firstname, String lastname, String phone, String country, String organisation, String id) async {
    var response = await adminRepository.updateUser(firstname, lastname, phone, country, organisation, id);
    updateUserProfile(firstname, lastname, phone, country, organisation, id);
  }
}
