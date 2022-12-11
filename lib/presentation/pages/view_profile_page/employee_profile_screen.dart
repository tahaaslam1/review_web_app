import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/auth_provider.dart';
import 'package:review_web_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:review_web_app/data/repositories/auth_repository/server_auth_repository.dart';
import 'package:review_web_app/models/user.dart';

import '../../../business_logic/providers/hrUserprovider.dart';
import '../../../logger.dart';

class EmployeeProfilePage extends StatefulWidget {
  static const route = 'employee-profile-screen';
  final String employeeId;
  EmployeeProfilePage({super.key, required this.employeeId});

  @override
  State<EmployeeProfilePage> createState() => _EmployeeProfilePageState();
}

class _EmployeeProfilePageState extends State<EmployeeProfilePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      if (context.read<HrProvider>().hasError &&
          context.read<HrProvider>().errorMessage == 'jwt expired') {
        Provider.of<ServerAuthRepository>(context, listen: false)
            .controller
            .add(AuthenticationStatus.unauthenticated);

        Provider.of<AuthProvider>(context, listen: false).setUser(
          User(
            firstName: '-',
            lastName: '-',
            userId: '-',
            email: '-',
            userType: UserType.unknown,
          ),
        );

        context.read<HrProvider>().reInitialize();
      }
    });
    context.read<HrProvider>().GetEmployee(widget.employeeId);

    super.initState();
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
                child: Consumer<HrProvider>(
                  builder: (context, provider, _) {
                    if (!provider.isLoading) {
                      return Column(
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
                                        provider.employeeUser.firstName! +
                                            provider.employeeUser.lastName!,
                                        style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 3.0),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.email,
                                              size: 10.0,
                                            ),
                                            Text(
                                              provider.employeeUser.email!,
                                              style: const TextStyle(
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
                                  const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "Company/ Organization:",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                        provider.employeeUser.organisation!),
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
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.phone),
                                        Text(provider.employeeUser.phone!),
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
                                      "Submission Description",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.description),
                                        Text(provider.employeeUser
                                            .submissionDescription!),
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
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.star),
                                        Text(provider
                                            .employeeUser.submissionTitle!),
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
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.star),
                                        Text(provider
                                            .employeeUser.reasonOfSubmission!),
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
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.person),
                                        Text(
                                            provider.employeeUser.submittedBy!),
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
                                      "identity type",
                                      // provider.employeeUser.identity_type!,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.perm_identity),
                                        const Text("identity nmber"
                                            // provider
                                            //   .employeeUser.identity_number!
                                            ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
