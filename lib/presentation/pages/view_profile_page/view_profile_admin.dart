import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/admin_provide.dart';
import 'package:review_web_app/models/hr.dart';

import 'package:review_web_app/presentation/pages/edit_user_profile/edit_user_profile.dart';

class ViewProfileAdmin extends StatefulWidget {
  String? user_id;
  ViewProfileAdmin({this.user_id, super.key});

  @override
  State<ViewProfileAdmin> createState() => _ViewProfileAdminState();
}

class _ViewProfileAdminState extends State<ViewProfileAdmin> {
  late HR response;
  late int bol;

  @override
  initState() {
    response = context.read<AdminProvider>().getProfile(widget.user_id!);
    bol = response.type_id as int;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 15.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 450,
              width: 500,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
