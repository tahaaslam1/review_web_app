// import 'package:checkapp/controller/AdminProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/presentation/pages/accept-reject-screen/accept-reject.dart';

import '../../../business_logic/providers/admin_provide.dart';
import 'employeeinfo.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 248, 247, 246),
        actions: [
          Consumer<AdminProvider>(
            builder: (context, provider, _) {
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      child: const Text('PROFILE'),
                      onPressed: () {
                        setState(() {
                          provider.value = "EMPLOYEE TABLE";
                          provider.tabletype = false;
                          provider.notifyListeners();
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      child: Text("USERS"),
                      onPressed: () {
                        setState(() {
                          provider.value = "USERS TABLE";
                          provider.tabletype = true;
                          provider.notifyListeners();
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      child: const Text('PENDING FOR APPROVAL'),
                      onPressed: () async {
                        await context
                            .read<AdminProvider>()
                            .GetUnapprovedUsers();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AcceptReject(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
        automaticallyImplyLeading: false,
        titleSpacing: 20,
        title: const Text(
          "ADMIN PORTAL",
          style: TextStyle(
            color: Color(0xff0A66C2),
            fontSize: 30,
            fontFamily: 'Anton',
          ),
        ),
      ),
      body: Consumer<AdminProvider>(
        builder: (context, provider, _) {
          if (!provider.loading) {
            if (provider.tabletype) {
              return Column(
                children: [
                  Column(
                    children: [
                      Text(
                        provider.value,
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xff0A66C2),
                          fontFamily: 'Anton',
                        ),
                      ),
                      Table(
                        border: TableBorder.all(
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                        children: List<TableRow>.generate(
                          provider.allHR.length,
                          (index) {
                            final user = provider.allHR[index];

                            return TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    user.first_name.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(user.last_name.toString(),
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(user.email.toString(),
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(user.country.toString(),
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(user.organisation.toString(),
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(user.phone.toString(),
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ],
              );
            } else {
              return Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Column(
                    children: [
                      Text(
                        provider.value,
                        style: TextStyle(
                          color: Color(0xff0A66C2),
                          fontSize: 30,
                          fontFamily: 'Anton',
                        ),
                      ),
                      Table(
                        border: TableBorder.all(
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                        children: List<TableRow>.generate(
                          provider.allEmployees.length,
                          (index) {
                            final employee = provider.allEmployees[index];

                            return TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(employee.first_name.toString(),
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(employee.last_name.toString(),
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(employee.email.toString(),
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(employee.passport.toString(),
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(employee.organisation.toString(),
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(employee.submitted_by.toString(),
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(employee.phone.toString(),
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                      employee.reason_for_submission.toString(),
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                      employee.submission_title.toString(),
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                      employee.submission_description
                                          .toString(),
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          // barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Add New Employee"),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              content:
                                  SizedBox(width: 400, child: EmployeeInfo()),
                            );
                          },
                        );
                      },
                      child: Icon(Icons.add, color: Colors.white),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        backgroundColor: Colors.blue, // <-- Button color
                        foregroundColor: Colors.red, // <-- Splash color
                      ),
                    ),
                  )
                ],
              );
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
