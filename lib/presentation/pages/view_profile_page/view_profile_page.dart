import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:review_web_app/data/repositories/auth_repository/server_auth_repository.dart';

import 'package:review_web_app/models/user.dart';

import 'package:review_web_app/presentation/pages/edit_user_profile_page/edit_user_profile_page.dart';

import '../../../business_logic/providers/auth_provider.dart';
import '../../../business_logic/providers/hrUserprovider.dart';
import '../../../logger.dart';

class ViewProfilePage extends StatefulWidget {
  static const String route = 'view-profile-page';

  const ViewProfilePage({super.key});

  @override
  State<ViewProfilePage> createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
  @override
  initState() {
    
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
    final response = Provider.of<AuthProvider>(context, listen: false).user;

    Provider.of<HrProvider>(context, listen: false)
        .getHR(response.userId!)
        .then((value) => logger.d('here '));

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 15.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 500,
              width: 500,
              child: SingleChildScrollView(
                child: Consumer<HrProvider>(
                  builder: (context, provider, _) {
                    if (!provider.isLoading) {
                      return Column(
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
                                        return AlertDialog(
                                          title: Text('Edit Info'),
                                          content: SizedBox(
                                            width: 700,
                                            child: //Text('hello')

                                                EditUserProfilePage(
                                              userType: UserType.hr,
                                              userId: provider.hr.userId,
                                            ),
                                            // //, type_id: widget.type_id!),
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
                                        provider.hr.firstName! +
                                            provider.hr.lastName!,
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
                                              provider.hr.email!,
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
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(provider.hr.organisation!),
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
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.phone),
                                        Text(provider.hr.phone!),
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
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.location_on),
                                        Text(provider.hr.country!),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //
                          //    (bol == 0)
                          //         ? Column(
                          //             children: [
                          //               Card(
                          //                 elevation: 10.0,
                          //                 child: Container(
                          //                   height: 100,
                          //                   width: double.infinity,
                          //                   child: Column(
                          //                     crossAxisAlignment:
                          //                         CrossAxisAlignment.start,
                          //                     mainAxisAlignment: MainAxisAlignment.center,
                          //                     children: [
                          //                       const Padding(
                          //                         padding: EdgeInsets.only(left: 8.0),
                          //                         child: Text(
                          //                           "Submission Description",
                          //                           style: TextStyle(
                          //                               fontSize: 15,
                          //                               fontWeight: FontWeight.bold),
                          //                         ),
                          //                       ),
                          //                       Padding(
                          //                         padding: const EdgeInsets.all(15.0),
                          //                         child: Row(
                          //                           children: const [
                          //                             Icon(Icons.description),
                          //                             Text(""),
                          //                           ],
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //               ),
                          //               Card(
                          //                 elevation: 10.0,
                          //                 child: Container(
                          //                   height: 100,
                          //                   width: double.infinity,
                          //                   child: Column(
                          //                     crossAxisAlignment:
                          //                         CrossAxisAlignment.start,
                          //                     mainAxisAlignment: MainAxisAlignment.center,
                          //                     children: [
                          //                       const Padding(
                          //                         padding: EdgeInsets.only(left: 8.0),
                          //                         child: Text(
                          //                           "Submission Title",
                          //                           style: TextStyle(
                          //                               fontSize: 15,
                          //                               fontWeight: FontWeight.bold),
                          //                         ),
                          //                       ),
                          //                       Padding(
                          //                         padding: const EdgeInsets.all(15.0),
                          //                         child: Row(
                          //                           children: const [
                          //                             Icon(Icons.star),
                          //                             Text("Employee review"),
                          //                           ],
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //               ),
                          //               Card(
                          //                 elevation: 10.0,
                          //                 child: Container(
                          //                   height: 100,
                          //                   width: double.infinity,
                          //                   child: Column(
                          //                     crossAxisAlignment:
                          //                         CrossAxisAlignment.start,
                          //                     mainAxisAlignment: MainAxisAlignment.center,
                          //                     children: [
                          //                       const Padding(
                          //                         padding: EdgeInsets.only(left: 8.0),
                          //                         child: Text(
                          //                           "Reason For submission",
                          //                           style: TextStyle(
                          //                               fontSize: 15,
                          //                               fontWeight: FontWeight.bold),
                          //                         ),
                          //                       ),
                          //                       Padding(
                          //                         padding: const EdgeInsets.all(15.0),
                          //                         child: Row(
                          //                           children: const [
                          //                             Icon(Icons.star),
                          //                             Text("Hamara marzi"),
                          //                           ],
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //               ),
                          //               Card(
                          //                 elevation: 10.0,
                          //                 child: Container(
                          //                   height: 100,
                          //                   width: double.infinity,
                          //                   child: Column(
                          //                     crossAxisAlignment:
                          //                         CrossAxisAlignment.start,
                          //                     mainAxisAlignment: MainAxisAlignment.center,
                          //                     children: [
                          //                       const Padding(
                          //                         padding: EdgeInsets.only(left: 8.0),
                          //                         child: Text(
                          //                           "du/dtu",
                          //                           style: TextStyle(
                          //                               fontSize: 15,
                          //                               fontWeight: FontWeight.bold),
                          //                         ),
                          //                       ),
                          //                       Padding(
                          //                         padding: const EdgeInsets.all(15.0),
                          //                         child: Row(
                          //                           children: const [
                          //                             Icon(Icons.star),
                          //                             Text("Yeh pta nhi kia cheez hai"),
                          //                           ],
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //               ),
                          //               Card(
                          //                 elevation: 10.0,
                          //                 child: Container(
                          //                   height: 100,
                          //                   width: double.infinity,
                          //                   child: Column(
                          //                     crossAxisAlignment:
                          //                         CrossAxisAlignment.start,
                          //                     mainAxisAlignment: MainAxisAlignment.center,
                          //                     children: [
                          //                       const Padding(
                          //                         padding: EdgeInsets.only(left: 8.0),
                          //                         child: Text(
                          //                           "Submitted by:",
                          //                           style: TextStyle(
                          //                               fontSize: 15,
                          //                               fontWeight: FontWeight.bold),
                          //                         ),
                          //                       ),
                          //                       Padding(
                          //                         padding: const EdgeInsets.all(15.0),
                          //                         child: Row(
                          //                           children: const [
                          //                             Icon(Icons.person),
                          //                             Text("Hunain Arif"),
                          //                           ],
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //               ),
                          //               Card(
                          //                 elevation: 10.0,
                          //                 child: Container(
                          //                   height: 100,
                          //                   width: double.infinity,
                          //                   child: Column(
                          //                     crossAxisAlignment:
                          //                         CrossAxisAlignment.start,
                          //                     mainAxisAlignment: MainAxisAlignment.center,
                          //                     children: [
                          //                       const Padding(
                          //                         padding: EdgeInsets.only(left: 8.0),
                          //                         child: Text(
                          //                           "National ID",
                          //                           style: TextStyle(
                          //                               fontSize: 15,
                          //                               fontWeight: FontWeight.bold),
                          //                         ),
                          //                       ),
                          //                       Padding(
                          //                         padding: const EdgeInsets.all(15.0),
                          //                         child: Row(
                          //                           children: const [
                          //                             Icon(Icons.perm_identity),
                          //                             Text("42101-123512515-3"),
                          //                           ],
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //               ),
                          //             ],
                          //           )
                          //         : Text(''),
                          //   ],
                          // ),
                          //   ),
                        ],
                      );
                    } else {
                      return CircularProgressIndicator();
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
