import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/admin_provide.dart';
import 'package:review_web_app/models/hr.dart';

import 'package:review_web_app/presentation/pages/edit_user_profile/edit_user_profile.dart';

class ViewProfilePage extends StatefulWidget {
  static const String route = 'view-profile-page';
  String? user_id;
  String? type_id;

  ViewProfilePage(this.user_id, this.type_id, {super.key});

  @override
  State<ViewProfilePage> createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
  late HR response;
  @override
  initState() {
    response = context.read<AdminProvider>().getUserProfile(widget.user_id!);
    // bol = response.type_id as int;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 15.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 500,
              width: 500,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: (() {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Expanded(
                                    child: AlertDialog(
                                      title: Text('Edit Info'),
                                      content: SizedBox(
                                          width: 700,
                                          child: EditUserProfile(
                                              user_id: widget.user_id!,
                                              type_id: widget.type_id!)),
                                    ),
                                  );
                                },
                              );
                            }),
                            child: const Text("Edit Profile"),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 500,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 50, // Image radius
                            backgroundImage: NetworkImage(
                                'https://www.shutterstock.com/image-vector/my-account-profile-user-icon-260nw-1700343232.jpg'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              children: [
                                Text(
                                  response.first_name! + response.last_name!,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.email,
                                        size: 10.0,
                                      ),
                                      Text(
                                        response.email!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 10),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 10.0,
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Company/ Organization:",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(response.organisation!),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10.0,
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Phone Number",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  Icon(Icons.phone),
                                  Text(response.phone!),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10.0,
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Country",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on),
                                  Text(response.country!),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //
                    //    (bol == 0)
                    //         ? Column(
                    //             children: [
                    //               Card(
                    //                 elevation: 10.0,
                    //                 child: Container(
                    //                   height: 100,
                    //                   width: double.infinity,
                    //                   child: Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       const Padding(
                    //                         padding: EdgeInsets.only(left: 8.0),
                    //                         child: Text(
                    //                           "Submission Description",
                    //                           style: TextStyle(
                    //                               fontSize: 15,
                    //                               fontWeight: FontWeight.bold),
                    //                         ),
                    //                       ),
                    //                       Padding(
                    //                         padding: const EdgeInsets.all(15.0),
                    //                         child: Row(
                    //                           children: const [
                    //                             Icon(Icons.description),
                    //                             Text(""),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //               Card(
                    //                 elevation: 10.0,
                    //                 child: Container(
                    //                   height: 100,
                    //                   width: double.infinity,
                    //                   child: Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       const Padding(
                    //                         padding: EdgeInsets.only(left: 8.0),
                    //                         child: Text(
                    //                           "Submission Title",
                    //                           style: TextStyle(
                    //                               fontSize: 15,
                    //                               fontWeight: FontWeight.bold),
                    //                         ),
                    //                       ),
                    //                       Padding(
                    //                         padding: const EdgeInsets.all(15.0),
                    //                         child: Row(
                    //                           children: const [
                    //                             Icon(Icons.star),
                    //                             Text("Employee review"),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //               Card(
                    //                 elevation: 10.0,
                    //                 child: Container(
                    //                   height: 100,
                    //                   width: double.infinity,
                    //                   child: Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       const Padding(
                    //                         padding: EdgeInsets.only(left: 8.0),
                    //                         child: Text(
                    //                           "Reason For submission",
                    //                           style: TextStyle(
                    //                               fontSize: 15,
                    //                               fontWeight: FontWeight.bold),
                    //                         ),
                    //                       ),
                    //                       Padding(
                    //                         padding: const EdgeInsets.all(15.0),
                    //                         child: Row(
                    //                           children: const [
                    //                             Icon(Icons.star),
                    //                             Text("Hamara marzi"),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //               Card(
                    //                 elevation: 10.0,
                    //                 child: Container(
                    //                   height: 100,
                    //                   width: double.infinity,
                    //                   child: Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       const Padding(
                    //                         padding: EdgeInsets.only(left: 8.0),
                    //                         child: Text(
                    //                           "du/dtu",
                    //                           style: TextStyle(
                    //                               fontSize: 15,
                    //                               fontWeight: FontWeight.bold),
                    //                         ),
                    //                       ),
                    //                       Padding(
                    //                         padding: const EdgeInsets.all(15.0),
                    //                         child: Row(
                    //                           children: const [
                    //                             Icon(Icons.star),
                    //                             Text("Yeh pta nhi kia cheez hai"),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //               Card(
                    //                 elevation: 10.0,
                    //                 child: Container(
                    //                   height: 100,
                    //                   width: double.infinity,
                    //                   child: Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       const Padding(
                    //                         padding: EdgeInsets.only(left: 8.0),
                    //                         child: Text(
                    //                           "Submitted by:",
                    //                           style: TextStyle(
                    //                               fontSize: 15,
                    //                               fontWeight: FontWeight.bold),
                    //                         ),
                    //                       ),
                    //                       Padding(
                    //                         padding: const EdgeInsets.all(15.0),
                    //                         child: Row(
                    //                           children: const [
                    //                             Icon(Icons.person),
                    //                             Text("Hunain Arif"),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //               Card(
                    //                 elevation: 10.0,
                    //                 child: Container(
                    //                   height: 100,
                    //                   width: double.infinity,
                    //                   child: Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       const Padding(
                    //                         padding: EdgeInsets.only(left: 8.0),
                    //                         child: Text(
                    //                           "National ID",
                    //                           style: TextStyle(
                    //                               fontSize: 15,
                    //                               fontWeight: FontWeight.bold),
                    //                         ),
                    //                       ),
                    //                       Padding(
                    //                         padding: const EdgeInsets.all(15.0),
                    //                         child: Row(
                    //                           children: const [
                    //                             Icon(Icons.perm_identity),
                    //                             Text("42101-123512515-3"),
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           )
                    //         : Text(''),
                    //   ],
                    // ),
                    //   ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
