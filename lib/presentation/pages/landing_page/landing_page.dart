import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/auth_provider.dart';
import 'package:review_web_app/business_logic/providers/unauth_wrapper_provider/unauth_wrapper_provider.dart';
import 'package:review_web_app/models/user.dart';
import 'package:review_web_app/presentation/pages/login_page/login_page.dart';
import 'package:review_web_app/routes/router.gr.dart';

class LandingPage extends StatelessWidget {
  static const String route = 'landing';

  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'SELECT USER TYPE',
                      style: TextStyle(
                          fontSize:
                              size.width * 0.05 * size.height / size.width,
                          color: Colors.blue),
                    ),
                  )
                ],
              ),
              OverflowBar(
                overflowAlignment: OverflowBarAlignment.center,
                overflowSpacing: 10,
                spacing: 40,
                children: [
                  // Container(
                  //   constraints: const BoxConstraints(
                  //     maxWidth: 300,
                  //     maxHeight: 300,
                  //     minWidth: 180,
                  //     minHeight: 180,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     border: Border.all(
                  //       width: 2.0,
                  //       color: Colors.white,
                  //     ),
                  //     borderRadius: BorderRadius.circular(10.0),
                  //     boxShadow: const [
                  //       BoxShadow(
                  //         blurRadius: 10,
                  //         color: Color.fromARGB(255, 160, 201, 253),
                  //         offset: Offset(1, 3),
                  //       ),
                  //     ],
                  //   ),
                  //   width: size.width / 5,
                  //   height: size.width / 5,
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.all(10.0),
                  //         child: Image.asset('assets/admin.jpg'),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.all(10.0),
                  //         child: SizedBox(
                  //           width: double.infinity,
                  //           child: ElevatedButton(
                  //             style: ElevatedButton.styleFrom(
                  //               minimumSize: const Size(200, 40),
                  //               maximumSize: const Size(200, 50),
                  //             ),
                  //             onPressed: () {
                  //               Navigator.pushNamed(context, LoginPage.route);
                  //             },
                  //             child: const Text('Admin'),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 300,
                      maxHeight: 300,
                      minWidth: 180,
                      minHeight: 180,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 2.0,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 10,
                          color: Color.fromARGB(255, 160, 201, 253),
                          offset: Offset(1, 3),
                        ),
                      ],
                    ),
                    width: size.width / 5,
                    height: size.width / 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset('assets/user.jpg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                maximumSize: const Size(200, 50),
                              ),
                              onPressed: () {
                                context
                                    .read<UnAuthWrapperProvider>()
                                    .navigateToSignUpPage();
                              },
                              child: const Text('User'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 300,
                      maxHeight: 300,
                      minWidth: 180,
                      minHeight: 180,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 2.0,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 10,
                          color: Color.fromARGB(255, 160, 201, 253),
                          offset: Offset(1, 3),
                        ),
                      ],
                    ),
                    width: size.width / 5,
                    height: size.width / 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset('assets/guest.jpg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200, 40),
                                maximumSize: const Size(200, 50),
                              ),
                              onPressed: () {
                                Provider.of<AuthProvider>(context,
                                        listen: false)
                                    .setUser(
                                  User(
                                    email: '-',
                                    firstName: '-',
                                    lastName: '-',
                                    userId: '-',
                                    userType: UserType.guest,
                                  ),
                                );
                              },
                              child: const Text('Guest'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
