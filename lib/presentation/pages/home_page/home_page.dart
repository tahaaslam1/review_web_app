import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/data/repositories/employees_repository/employees_repository.dart';
import 'package:review_web_app/logger.dart';
import 'package:review_web_app/models/employees.dart';
import 'package:review_web_app/presentation/pages/home_page/local_widgets/employee_info_widget.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/insert_review_page.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/insert_review_large_screen.dart';

import '../../../business_logic/providers/hrUserprovider.dart';
import '../view_profile_page/employee_profile_screen.dart';
import '../view_profile_page/view_profile_page.dart';

class HomePage extends StatefulWidget {
  static const String route = 'home-page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EmployeesRepository emp = EmployeesRepository();
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
              child: LayoutBuilder(
                builder: (_, BoxConstraints constraints) {
                  return Autocomplete<Employee>(
                    displayStringForOption: (option) {
                      return '${option.firstName} ${option.lastName}';
                    },
                    optionsBuilder: (textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<Employee>.empty();
                      }
                      return emp.getSearchedEmployees(
                          value: textEditingValue.text);
                    },
                    optionsViewBuilder: (context, onSelected, options) {
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          elevation: 20.0,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 2,
                            width: constraints.maxWidth,
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              itemCount: options.length,
                              itemBuilder: (context, index) {
                                final option = options.elementAt(index);
                                return GestureDetector(
                                  onTap: () async {
                                    await context
                                        .read<HrProvider>()
                                        .GetUser(option.employeeId!);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EmployeeProfileScreen()),
                                    );
                                  },
                                  child: ListTile(
                                    title: Text(
                                      '${option.firstName} ${option.lastName}',
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                            ),
                          ),
                        ),
                      );
                    },
                    fieldViewBuilder: (context, textEditingController,
                        focusNode, onFieldSubmitted) {
                      return TextField(
                        controller: textEditingController,
                        focusNode: focusNode,
                        onEditingComplete: onFieldSubmitted,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              // borderSide: BorderSide()

                              ),
                          hintText: 'Search Employees',
                          suffixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF0A66C2),
                          ),
                        ),
                      );
                    },
                  );
                },
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
