import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/admin_provider.dart';
import 'package:review_web_app/business_logic/providers/auth_provider.dart';
import 'package:review_web_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:review_web_app/data/repositories/auth_repository/server_auth_repository.dart';
import 'package:review_web_app/models/hr.dart';
import 'package:review_web_app/models/user.dart';

class ViewProfileAdminPage extends StatefulWidget {
  static const route = 'view-profile-admin-page';

  String? userId;
  ViewProfileAdminPage({this.userId, super.key});

  @override
  State<ViewProfileAdminPage> createState() => _ViewProfileAdminPageState();
}

class _ViewProfileAdminPageState extends State<ViewProfileAdminPage> {
  late HR response;
  late int bol;

  @override
  initState() {
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      if (context.read<AdminProvider>().hasError &&
          context.read<AdminProvider>().errorMessage == 'jwt expired') {
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

        context.read<AdminProvider>().reInitialize();
      }
    });
    response = context.read<AdminProvider>().getProfile(widget.userId!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 15.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 450,
              width: 500,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
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
                                  response.firstName! + response.lastName!,
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.email,
                                        size: 10.0,
                                      ),
                                      Text(
                                        response.email!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w100,
                                          fontSize: 10,
                                        ),
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
                      child: SizedBox(
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
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(response.organisation!),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10.0,
                      child: SizedBox(
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
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.phone),
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
                      child: SizedBox(
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
                                  const Icon(Icons.location_on),
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
