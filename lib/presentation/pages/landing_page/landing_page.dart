import 'package:flutter/material.dart';
import 'package:review_web_app/presentation/pages/login_page/login_page.dart';

class LandingPage extends StatelessWidget {
  static const String route = 'landing-page';

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
                      'Select user type',
                      style: TextStyle(fontSize: size.width * 0.05 * size.height / size.width, color: Colors.blue),
                    ),
                  )
                ],
              ),
              OverflowBar(
                overflowAlignment: OverflowBarAlignment.center,
                overflowSpacing: 10,
                spacing: 40,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                        BoxShadow(blurRadius: 10, color: Color.fromARGB(255, 160, 201, 253), offset: Offset(1, 3)),
                      ],
                    ),
                    width: size.width / 5,
                    height: size.width / 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset('assets/images/admin.jpg'),
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
                                Navigator.pushNamed(context, LoginPage.route);
                              },
                              child: const Text('Admin'),
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
                          child: Image.asset('assets/images/user.jpg'),
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
                              onPressed: null,
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
                        boxShadow: const [BoxShadow(blurRadius: 10, color: Color.fromARGB(255, 160, 201, 253), offset: Offset(1, 3))]),
                    width: size.width / 5,
                    height: size.width / 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset('assets/images/guest.jpg'),
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
                              onPressed: null
                              // () {
                              //   Navigator.pushNamed(context, LoginPage.route);
                              // }
                              ,
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
