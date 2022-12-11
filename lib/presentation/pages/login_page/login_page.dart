// import 'package:checkapp/controller/userController.dart';
// import 'package:raiting_app/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/hrUserprovider.dart';
import 'package:review_web_app/business_logic/providers/login_provider.dart';
import 'package:review_web_app/logger.dart';
import 'package:review_web_app/presentation/pages/home_page/home_page.dart';

class LoginPage extends StatefulWidget {
  static const String route = 'login-page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _failSnackbar(String error) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(
        error,
        textAlign: TextAlign.center,
        style: const TextStyle(),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Card(
                elevation: 20,
                child: Consumer<HrProvider>(
                  builder: (context, provider, _) {
                    return Container(
                      height: 400,
                      width: 400,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Color.fromARGB(255, 248, 247, 246),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 40),
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                color: Color(0xff0A66C2),
                                fontSize: 30.0,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.5,
                                height: 2.00,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 40),
                            child: TextField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Email'),
                              controller: emailController,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40, right: 40),
                            child: TextField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Password'),
                              controller: passwordController,
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              height: 50,
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final response =
                                      await Provider.of<LoginProvider>(context,
                                              listen: false)
                                          .tryLogin(emailController.text,
                                              passwordController.text);

                                  logger.i(response);
                                  if (response != '') {
                                    _failSnackbar(response!);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff0A66C2),
                                  elevation: 10,
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
