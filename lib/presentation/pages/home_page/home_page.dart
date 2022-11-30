import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:review_web_app/presentation/pages/home_page/local_widgets/employee_info_widget.dart';

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
          leading: const Icon(
            Icons.person_outline,
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
          actions: const [
            Padding(
              padding: EdgeInsets.only(
                right: 16.0,
              ),
              child: Center(
                child: Text(
                  style: TextStyle(
                    color: Color(0xFF0A66C2),
                  ),
                  'ADD REVIEW',
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