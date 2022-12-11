// import 'package:checkapp/controller/AdminProvider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/auth_provider.dart';
import 'package:review_web_app/data/repositories/auth_repository/server_auth_repository.dart';
import 'package:review_web_app/logger.dart';
import 'package:review_web_app/models/user.dart';
import 'package:review_web_app/presentation/pages/accept-reject-screen/accept_reject_page.dart';
import 'package:review_web_app/presentation/pages/admin_screen/employeeinfo.dart';
import 'package:review_web_app/presentation/pages/edit_user_profile_page/edit_user_profile_page.dart';
import 'package:review_web_app/routes/router.gr.dart';

import '../../../business_logic/providers/admin_provider.dart';

class AdminPage extends StatefulWidget {
  static const route = 'admin-page';
  const AdminPage({super.key});
  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  void initState() {
    logger.d('heelo');
    context.read<AdminProvider>().GetAllUsers();

    super.initState();
  }

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
                        context.router.push(AcceptRejectRoute());
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      child: const Text('Log out'),
                      onPressed: () async {
                        Provider.of<ServerAuthRepository>(context,
                                listen: false)
                            .signOut();

                        Provider.of<AuthProvider>(context, listen: false)
                            .setUser(
                          User(
                            firstName: '-',
                            lastName: '-',
                            userId: '-',
                            email: '-',
                            userType: UserType.unknown,
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
      body: SingleChildScrollView(
        child: Consumer<AdminProvider>(
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
                                      user.firstName.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(user.lastName.toString(),
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
                                    child: Text(user.isApproved.toString(),
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
                                                title: Text('Edit Info'),
                                                content: SizedBox(
                                                  width: 700,
                                                  child: EditUserProfilePage(
                                                    userType: UserType.admin,
                                                    userId: user.userId,
                                                  ),
                                                ),
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
                                              .DeleteUser(user.userId!);
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
                                    child: Text(
                                        employee.organisation.toString(),
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
                                        employee.submissionDescription
                                            .toString(),
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
                    // Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       showDialog(
                    //         context: context,
                    //         // barrierDismissible: false,
                    //         builder: (BuildContext context) {
                    //           return AlertDialog(
                    //             title: const Text("Add New Employee"),
                    //             shape: RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.circular(20),
                    //             ),
                    //             content: SizedBox(
                    //               width: 400,
                    //               child: EmployeeInfo(),
                    //             ),
                    //           );
                    //         },
                    //       );
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //       shape: const CircleBorder(),
                    //       padding: const EdgeInsets.all(20),
                    //       backgroundColor: Colors.blue, // <-- Button color
                    //       foregroundColor: Colors.red, // <-- Splash color
                    //     ),
                    //     child: const Icon(Icons.add, color: Colors.white),
                    //   ),
                    // )
                  ],
                );
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
