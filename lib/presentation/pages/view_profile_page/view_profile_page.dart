import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:review_web_app/presentation/pages/edit_user_profile/edit_user_profile.dart';

bool bol = false;

class ViewProfilePage extends StatelessWidget {
  static const String route = 'view-profile-page';

  ViewProfilePage({super.key});

  @override
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
                                      title: const Text('Edit Info'),
                                      content: SizedBox(
                                        width: 700,
                                        child: EditUserProfile(userType: bol),
                                      ),
                                      actions: [
                                        Center(
                                          child: SizedBox(
                                            height: 60,
                                            width: 90,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              child: const Text('SAVE'),
                                            ),
                                          ),
                                        ),
                                      ],
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
                            backgroundImage: NetworkImage('https://www.shutterstock.com/image-vector/my-account-profile-user-icon-260nw-1700343232.jpg'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              children: [
                                const Text(
                                  "Hunain Arif",
                                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.email,
                                        size: 10.0,
                                      ),
                                      Text(
                                        "huninarif30@gmail.com",
                                        style: TextStyle(fontWeight: FontWeight.w100, fontSize: 10),
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
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Company/ Organization:",
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text("Pakistan"),
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
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: const [
                                  Icon(Icons.phone),
                                  Text("090078601"),
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
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: const [
                                  Icon(Icons.location_on),
                                  Text("Pakistan"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    bol
                        ? Column(
                            children: [
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
                                          "Submission Description",
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: const [
                                            Icon(Icons.description),
                                            Text("description..."),
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
                                          "Submission Title",
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: const [
                                            Icon(Icons.star),
                                            Text("Employee review"),
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
                                          "Reason For submission",
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: const [
                                            Icon(Icons.star),
                                            Text("Hamara marzi"),
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
                                          "du/dtu",
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: const [
                                            Icon(Icons.star),
                                            Text("Yeh pta nhi kia cheez hai"),
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
                                          "Submitted by:",
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: const [
                                            Icon(Icons.person),
                                            Text("Hunain Arif"),
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
                                          "National ID",
                                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: const [
                                            Icon(Icons.perm_identity),
                                            Text("42101-123512515-3"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const Text(''),
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
