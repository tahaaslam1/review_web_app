import 'package:flutter/material.dart';

class EditUserProfile extends StatelessWidget {
  static const String route = 'edit-user-profile';
  bool userType;
  EditUserProfile({required this.userType, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: "Enter Name",
                    labelStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w100,
                    ),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w100,
                    ),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.people),
                    labelText: "Organisation",
                    labelStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w100,
                    ),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone),
                    labelText: "Phone",
                    labelStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w100,
                    ),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.location_on),
                    labelText: "Country",
                    labelStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w100,
                    ),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              userType
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.location_on),
                              labelText: "Country",
                              labelStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.description),
                              labelText: "Submission type",
                              labelStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.location_on),
                              labelText: "Reason For Submission",
                              labelStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.location_on),
                              labelText: "DU/DTU",
                              labelStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.location_on),
                              labelText: "Submitted By:",
                              labelStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.location_on),
                              labelText: "National ID",
                              labelStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                              ),
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Text(""),
            ],
          ),
        ),
      ),
    );
  }
}
