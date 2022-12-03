import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/logger.dart';
import 'package:review_web_app/presentation/pages/admin_screen/admin_screen.dart';

import '../../../business_logic/providers/admin_provide.dart';
import '../../../models/hr.dart';

class EditUserProfile extends StatefulWidget {
  static const String route = 'edit-user-profile';
  late String user_id;
  late String type_id;
  EditUserProfile({super.key, required this.user_id, required this.type_id});

  @override
  State<EditUserProfile> createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  late HR response;
  late TextEditingController firstname = TextEditingController();
  late TextEditingController lastname = TextEditingController();
  late TextEditingController organisation = TextEditingController();
  late TextEditingController phone = TextEditingController();
  late TextEditingController country = TextEditingController();
  late TextEditingController email = TextEditingController();
  @override
  initState() {
    response = context.read<AdminProvider>().getUserProfile(widget.user_id!);
    firstname.text = response.first_name!;
    lastname.text = response.last_name!;
    organisation.text = response.organisation!;

    phone.text = response.phone!;
    country.text = response.country!;
    email.text = response.email!;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  controller: firstname,
                  decoration: InputDecoration(
                    labelText: "First Name",
                    icon: Icon(Icons.person),
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
                  controller: lastname,
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    icon: Icon(Icons.person),
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
                  controller: organisation,
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
                  controller: phone,
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
                  controller: country,
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
              Center(
                child: SizedBox(
                  height: 60,
                  width: 90,
                  child: ElevatedButton(
                    onPressed: () async {
                      context.read<AdminProvider>().UpdateHR(
                          firstname.text,
                          lastname.text,
                          phone.text,
                          country.text,
                          organisation.text,
                          widget.user_id);

                      if (widget.type_id == "1") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminScreen(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminScreen(),
                          ),
                        );
                      }
                    },
                    child: Text('SAVE'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
