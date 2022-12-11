import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/auth_provider.dart';
import 'package:review_web_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:review_web_app/data/repositories/auth_repository/server_auth_repository.dart';
import 'package:review_web_app/data/repositories/employees_repository/employees_repository.dart';
import 'package:review_web_app/models/employees.dart';
import 'package:review_web_app/models/hr.dart';
import 'package:review_web_app/models/user.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/insert_review_page.dart';
import 'package:review_web_app/routes/router.gr.dart';

import '../../../business_logic/providers/hrUserprovider.dart';
import '../../../logger.dart';
import '../view_profile_page/view_profile_page.dart';
import 'local_widgets/employee_info_widget.dart';

class HomePage extends StatefulWidget {
  static const String route = 'home-page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserType userType;
  @override
  void initState() {
    
    userType = Provider.of<AuthProvider>(context, listen: false).user.userType!;
    if (userType == UserType.hr) {
      context
          .read<HrProvider>()
          .getEmployeeByUserId(
              Provider.of<AuthProvider>(context, listen: false).user.userId!)
          .then((value) => logger.d('hel'));
    }
    super.initState();
  }

  EmployeesRepository emp = EmployeesRepository();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (userType == UserType.guest) {
          Provider.of<AuthProvider>(context, listen: false).setUser(
            User(
              firstName: '-',
              lastName: '-',
              userId: '-',
              email: '-',
              userType: UserType.unknown,
            ),
          );
        }
        return Future.value(true);
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 248, 247, 246),
            automaticallyImplyLeading: false,
            leading: userType == UserType.guest
                ? IconButton(
                    onPressed: () {
                      Provider.of<AuthProvider>(context, listen: false).setUser(
                        User(
                          firstName: '-',
                          lastName: '-',
                          userId: '-',
                          email: '-',
                          userType: UserType.unknown,
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF0A66C2),
                    ),
                  )
                : IconButton(
                    onPressed: () async {
                      context.router.push(const ViewProfileRoute());
                    },
                    icon: const Icon(Icons.person_outline),
                    color: const Color(0xFF0A66C2),
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
                                      context.router.push(EmployeeProfileRoute(
                                          employeeId: option.employeeId!));
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
            actions: userType == UserType.guest
                ? []
                : [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 16.0,
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                context.router
                                    .replace(const InsertReviewRoute());
                              },
                              child: const Text('ADD REVIEW'),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                Provider.of<ServerAuthRepository>(context,
                                        listen: false)
                                    .signOut();
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .setUser(
                                  User(
                                    firstName: '-',
                                    lastName: '-',
                                    userId: '-',
                                    email: '-',
                                    userType: UserType.unknown,
                                  ),
                                );
                              },
                              child: const Text("Logout"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
          ),
          body: userType == UserType.guest
              ? const Center(
                  child: SizedBox(),
                )
              : Center(
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
                      child: Consumer<HrProvider>(
                        builder: (context, provider, _) {
                          if (!provider.isLoading) {
                            return ListView.builder(
                              itemCount: provider.allEmp.length,
                              itemBuilder: ((BuildContext context, index) {
                                return EmployeeInfoWidget(
                                  empName: provider.allEmp[index].firstName! +
                                      provider.allEmp[index].lastName!,
                                  empOrganization:
                                      provider.allEmp[index].organisation!,
                                  submissonTitle:
                                      provider.allEmp[index].submissionTitle!,
                                  submissionDescription: provider
                                      .allEmp[index].submissionDescription!,
                                );
                              }),
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
