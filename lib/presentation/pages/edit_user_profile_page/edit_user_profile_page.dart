// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/hrUserprovider.dart';
import 'package:review_web_app/logger.dart';
import 'package:review_web_app/presentation/pages/admin_screen/admin_page.dart';
import 'package:review_web_app/presentation/pages/view_profile_page/view_profile_page.dart';

import '../../../business_logic/providers/admin_provider.dart';
import '../../../models/hr.dart';

class EditUserProfilePage extends StatefulWidget {
  static const String route = 'edit-user-profile';
  late String user_id;
  //late int type_id;
  //EditUserProfilePage({super.key, required this.user_id, required this.type_id});

  //EditUserProfilePage({super.key, required this.user_id});

  @override
  State<EditUserProfilePage> createState() => _EditUserProfilePageState();
}

class _EditUserProfilePageState extends State<EditUserProfilePage> {
  late HR response;
  late TextEditingController firstname = TextEditingController();
  late TextEditingController lastname = TextEditingController();
  late TextEditingController organisation = TextEditingController();
  late TextEditingController phone = TextEditingController();
  late TextEditingController country = TextEditingController();
  late TextEditingController email = TextEditingController();
  @override
  initState() {
    // if (widget.type_id == 1) {
    //   response = context.read<HrProvider>().hrUser;
    // } else {
    //   response = context.read<AdminProvider>().getUserProfile(widget.user_id);
    // }

    firstname.text = response.firstName!;
    lastname.text = response.lastName!;
    organisation.text = response.organisation!;

    phone.text = response.phone!;
    country.text = response.country!;
    email.text = response.email!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                controller: firstname,
                decoration: InputDecoration(
                  labelText: "First Name",
                  icon: const Icon(Icons.person),
                  labelStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                  ),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
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
                  icon: const Icon(Icons.person),
                  labelStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                  ),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
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
                  icon: const Icon(Icons.people),
                  labelText: "Organisation",
                  labelStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                  ),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
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
                  icon: const Icon(Icons.phone),
                  labelText: "Phone",
                  labelStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                  ),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
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
                  icon: const Icon(Icons.location_on),
                  labelText: "Country",
                  labelStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w100,
                  ),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
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
                    // if (widget.type_id == 1) {
                    //   context.read<HrProvider>().UpdateHR(
                    //         firstname.text,
                    //         lastname.text,
                    //         phone.text,
                    //         country.text,
                    //         organisation.text,
                    //         widget.user_id,
                    //       );
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => ViewProfilePage(widget.user_id, widget.type_id)),
                    //   );
                    // } else {
                    //   context.read<AdminProvider>().UpdateHR(
                    //         firstname.text,
                    //         lastname.text,
                    //         phone.text,
                    //         country.text,
                    //         organisation.text,
                    //         widget.user_id,
                    //       );
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const AdminScreen(),
                    //     ),
                    //   );
                    // }
                  },
                  child: const Text('SAVE'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
