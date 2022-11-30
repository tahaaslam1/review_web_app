import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:review_web_app/models/employees.dart';
import 'package:review_web_app/models/hr.dart';

import '../../data/repositories/admin_repository/admin_repo.dart';

class AdminProvider extends ChangeNotifier {
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
    _allUnapproved.removeWhere((element) => element.user_id == id);
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
    _isLoading = true;
    var response = await adminRepository.getUnapprovedUsers();
    var decodedData = jsonDecode(response.body);
    print(decodedData);
    for (var m in decodedData['data']) {
      allUnapproved.add(HR.fromJson(m));
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> AcceptUser(String id) async {
    var response = await adminRepository.acceptUser(id);
    removeHR(id);

    notifyListeners();
  }

  Future<void> RejectUser(String id) async {
    var response = await adminRepository.rejectUser(id);
    removeHR(id);

    notifyListeners();
  }
}
