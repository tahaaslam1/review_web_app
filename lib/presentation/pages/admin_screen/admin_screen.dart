// import 'package:checkapp/controller/adminController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        // appBar: AppBar(
        //   backgroundColor: Color.fromARGB(255, 248, 247, 246),
        //   actions: [
        //     Consumer<AdminController>(
        //       builder: (context, provider, _) {
        //         return Row(
        //           children: [
        //             Padding(
        //               padding: const EdgeInsets.all(10),
        //               child: ElevatedButton(
        //                 child: const Text('PROFILE'),
        //                 onPressed: () {
        //                   setState(() {
        //                     // provider.value = "EMPLOYEE TABLE";
        //                     // provider.tabletype = false;
        //                     // provider.notifyListeners();
        //                   });
        //                 },
        //               ),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.all(10),
        //               child: ElevatedButton(
        //                 child: Text("USERS"),
        //                 onPressed: () {
        //                   setState(() {
        //                     // provider.value = "USERS TABLE";
        //                     // provider.tabletype = true;
        //                     // provider.notifyListeners();
        //                   });
        //                 },
        //               ),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.all(10),
        //               child: ElevatedButton(
        //                 child: const Text('PENDING FOR APPROVAL'),
        //                 onPressed: () {},
        //               ),
        //             ),
        //           ],
        //         );
        //       },
        //     ),
        //   ],
        //   automaticallyImplyLeading: false,
        //   titleSpacing: 20,
        //   title: const Text(
        //     "ADMIN PORTAL",
        //     style: TextStyle(
        //       color: Color(0xff0A66C2),
        //       fontSize: 30,
        //       fontFamily: 'Anton',
        //     ),
        //   ),
        // ),
        // body: Consumer<AdminController>(
        //   builder: (context, provider, _) {
        //     if (!provider.loading) {
        //       if (provider.tabletype) {
        //         return
        body: Column(
      children: [
        Column(
          children: [
            Text(
              // provider.value,
              "user", // bad mai change krna
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
                //provider.registeredUsers.length,
                3,
                (index) {
                  //final user = provider.registeredUsers[index];
                  final user = [];
                  return TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          // user.userId.toString(),
                          "ye bad mai change krna hai",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                            //user.email.toString(),
                            "ye bad mai change krna hai",
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                            //user.username.toString(),
                            "ye bad mai change krna hai",
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
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Column(
              children: [
                Text(
                  //provider.value,
                  "bad mai change krna hai",
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
                    //provider.employees.length,
                    4, // bad mai change krna hai
                    (index) {
                      //final employee = provider.employees[index];
                      final Employee = [];
                      return TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                                //employee.username.toString(),
                                "bad mai change krna hai",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                                //employee.review.toString(),
                                "bad mai change krna hai",
                                style: TextStyle(fontSize: 18),
                                textAlign: TextAlign.center),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                                //employee.rating.toString(),
                                "bad mai change krna hai",
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
                        content: SizedBox(width: 400, child: EmployeeInfo()),
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
        )
      ],
    )

        //}
        //else {
        //return

        // }
        // } else {
        //   return CircularProgressIndicator();
        // }
        //},

        );
  }
}
