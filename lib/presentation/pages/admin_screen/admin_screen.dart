// import 'package:checkapp/controller/AdminProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/presentation/pages/accept-reject-screen/accept-reject.dart';
import 'package:review_web_app/presentation/pages/edit_user_profile/edit_user_profile.dart';

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
        backgroundColor: const Color.fromARGB(255, 248, 247, 246),
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
                      child: const Text("USERS"),
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
                            builder: (context) => const AcceptReject(),
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
                        style: const TextStyle(
                          fontSize: 30,
                          color: Color(0xff0A66C2),
                          fontFamily: 'Anton',
                        ),
                      ),
                      Table(
                        border: TableBorder.all(
                          color: const Color.fromRGBO(0, 0, 0, 1),
                        ),
                        children: List<TableRow>.generate(
                          provider.allHR.length == 0 ? 0 : 1,
                          (index) {
                            return const TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "FIRST NAME",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("LAST NAME",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("EMAIL",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("COUNTRY",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("ORGANISATION",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("PHONE",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("STATUS",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("EDIT/DELETE",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Table(
                        border: TableBorder.all(
                          color: const Color.fromRGBO(0, 0, 0, 1),
                        ),
                        children: List<TableRow>.generate(
                          provider.allHR.length,
                          (index) {
                            final user = provider.allHR[index];

                            return TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    user.first_name.toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(user.last_name.toString(),
                                      style: const TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(user.email.toString(),
                                      style: const TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(user.country.toString(),
                                      style: const TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(user.organisation.toString(),
                                      style: const TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(user.phone.toString(),
                                      style: const TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(user.is_approved.toString(),
                                      style: const TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Edit Info'),
                                              content: SizedBox(
                                                  width: 700,
                                                  child: EditUserProfile(
                                                    user_id: user.user_id!,
                                                    type_id: 0,
                                                  )),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () async {
                                        await context
                                            .read<AdminProvider>()
                                            .DeleteUser(user.user_id!);
                                      },
                                    ),
                                  ],
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
                        style: const TextStyle(
                          color: Color(0xff0A66C2),
                          fontSize: 30,
                          fontFamily: 'Anton',
                        ),
                      ),
                      Table(
                        border: TableBorder.all(
                          color: const Color.fromRGBO(0, 0, 0, 1),
                        ),
                        children: List<TableRow>.generate(
                          provider.allHR.length == 0 ? 0 : 1,
                          (index) {
                            return const TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "FIRST NAME",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "LAST NAME",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("EMAIL",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("ORGANISATION",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("SUBMITTED BY",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("PHONE",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("REASON FOR SUBMISSION",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("SUBMISSION TITLE",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("SUBMISSION DESCRIPTION,",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Table(
                        border: TableBorder.all(
                          color: const Color.fromRGBO(0, 0, 0, 1),
                        ),
                        children: List<TableRow>.generate(
                          provider.allEmployees.length,
                          (index) {
                            final employee = provider.allEmployees[index];

                            return TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(employee.firstName.toString(),
                                      style: const TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(employee.lastName.toString(),
                                      style: const TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(employee.email.toString(),
                                      style: const TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(employee.organisation.toString(),
                                      style: const TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(employee.submittedBy.toString(),
                                      style: const TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(employee.phone.toString(),
                                      style: const TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                      employee.reasonOfSubmission.toString(),
                                      style: const TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                      employee.submissionTitle.toString(),
                                      style: const TextStyle(fontSize: 18),
                                      textAlign: TextAlign.center),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                      employee.submissionDescription.toString(),
                                      style: const TextStyle(fontSize: 18),
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
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
