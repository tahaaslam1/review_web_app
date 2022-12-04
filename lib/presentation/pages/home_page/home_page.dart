import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/hrUserprovider.dart';
import 'package:review_web_app/presentation/pages/home_page/local_widgets/employee_info_widget.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/insert_review_page.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/insert_review_large_screen.dart';

import '../view_profile_page/view_profile_page.dart';

class HomePage extends StatelessWidget {
  static const String route = 'home-page';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 248, 247, 246),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () async {
              var response = await context.read<HrProvider>().hrUser;
              // ignore: use_build_context_synchronously
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ViewProfilePage(response.user_id, response.type_id)),
              );
            },
            icon: Icon(Icons.person_outline),
            color: Color(0xFF0A66C2),
          ),
          title: Container(
            color: const Color.fromARGB(255, 200, 212, 248),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              //TODO: functionality
              child: DropdownSearch(
                dropdownButtonProps: const DropdownButtonProps(
                  color: Color(0xFF0A66C2),
                  icon: Icon(Icons.search, size: 24.0),
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: 16.0,
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InsertReview()),
                    );
                  },
                  child: Text('ADD REVIEW'),
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Card(
            elevation: 30.0,
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 248, 247, 246),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: ListView(
                children: const [
                  EmployeeInfoWidget(
                    empName: 'Taha Aslam',
                    empOrganization: 'Tixsee Labs LLC',
                    submissonTitle: 'Hello Title',
                    submissionDescription: 'This is a test description.......',
                  ),
                  EmployeeInfoWidget(
                    empName: 'Taha Aslam',
                    empOrganization: 'Tixsee Labs LLC',
                    submissonTitle: 'Hello Title',
                    submissionDescription: 'This is a test description.......',
                  ),
                  EmployeeInfoWidget(
                    empName: 'Taha Aslam',
                    empOrganization: 'Tixsee Labs LLC',
                    submissonTitle: 'Hello Title',
                    submissionDescription: 'This is a test description.......',
                  ),
                  EmployeeInfoWidget(
                    empName: 'Taha Aslam',
                    empOrganization: 'Tixsee Labs LLC',
                    submissonTitle: 'Hello Title',
                    submissionDescription: 'This is a test description.......',
                  ),
                  EmployeeInfoWidget(
                    empName: 'Taha Aslam',
                    empOrganization: 'Tixsee Labs LLC',
                    submissonTitle: 'Hello Title',
                    submissionDescription: 'This is a test description.......',
                  ),
                  EmployeeInfoWidget(
                    empName: 'Taha Aslam',
                    empOrganization: 'Tixsee Labs LLC',
                    submissonTitle: 'Hello Title',
                    submissionDescription: 'This is a test description.......',
                  ),
                  EmployeeInfoWidget(
                    empName: 'Taha Aslam',
                    empOrganization: 'Tixsee Labs LLC',
                    submissonTitle: 'Hello Title',
                    submissionDescription: 'This is a test description.......',
                  ),
                  EmployeeInfoWidget(
                    empName: 'Taha Aslam',
                    empOrganization: 'Tixsee Labs LLC',
                    submissonTitle: 'Hello Title',
                    submissionDescription: 'This is a test description.......',
                  ),
                  EmployeeInfoWidget(
                    empName: 'Taha Aslam',
                    empOrganization: 'Tixsee Labs LLC',
                    submissonTitle: 'Hello Title',
                    submissionDescription: 'This is a test description.......',
                  ),
                  EmployeeInfoWidget(
                    empName: 'Taha Aslam',
                    empOrganization: 'Tixsee Labs LLC',
                    submissonTitle: 'Hello Title',
                    submissionDescription: 'This is a test description.......',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
