import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/hrUserprovider.dart';
import 'package:review_web_app/business_logic/providers/unauth_wrapper_provider/unauth_wrapper_provider.dart';
import 'package:review_web_app/presentation/pages/login_page/login_page.dart';

class SignUpPage extends StatefulWidget {
  static const String route = 'signup-page';
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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

  TextEditingController firstameController = TextEditingController();

  TextEditingController lastameController = TextEditingController();

  TextEditingController organisationController = TextEditingController();

  TextEditingController phnumberController = TextEditingController();

  TextEditingController countrynameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<UnAuthWrapperProvider>().navigateToLandingPage();
        return Future<bool>(() => true);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Consumer<HrProvider>(
            builder: (context, provider, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Form(
                      key: _formkey,
                      child: Card(
                        elevation: 20,
                        child: Container(
                            height: 800,
                            width: 500,
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
                                    "SignUp",
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
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'First Name'),
                                    controller: firstameController,
                                    validator: RequiredValidator(errorText: "Required*"),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40, right: 40),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Last Name'),
                                    controller: lastameController,
                                    validator: RequiredValidator(errorText: "Required*"),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40, right: 40),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Company Name'),
                                    controller: organisationController,
                                    validator: RequiredValidator(errorText: "Required*"),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40, right: 40),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Phone Number'),
                                    controller: phnumberController,
                                    validator: RequiredValidator(errorText: "Required*"),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40, right: 40),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Country'),
                                    controller: countrynameController,
                                    validator: RequiredValidator(errorText: "Required*"),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40, right: 40),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Email'),
                                    controller: emailController,
                                    validator: EmailValidator(errorText: "wrong email format"),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40, right: 40),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Password'),
                                    controller: passwordController,
                                    validator: (value) {
                                      if (value != confirmPasswordController.text) {
                                        return 'Password must match';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40, right: 40),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Confirm Password'),
                                    controller: confirmPasswordController,
                                    validator: (value) {
                                      if (value != passwordController.text) {
                                        return 'Password must match';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Center(
                                  child: SizedBox(
                                    height: 50,
                                    width: 200,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (_formkey.currentState?.validate() == false) {
                                          _failSnackbar('Invalid Credentials');
                                        } else {
                                          await context.read<HrProvider>().trySignup(firstameController.text, lastameController.text, organisationController.text, phnumberController.text, countrynameController.text, emailController.text, passwordController.text);
                                          if (provider.hasError) {
                                            _failSnackbar('email already registered');
                                          } else {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => LoginPage(),
                                              ),
                                            );
                                          }
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xff0A66C2),
                                        elevation: 10,
                                      ),
                                      child: const Text(
                                        "Register",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: const [
                                    Expanded(
                                      child: Divider(
                                        indent: 20.0,
                                        endIndent: 10.0,
                                        thickness: 1.5,
                                      ),
                                    ),
                                    Text(
                                      "OR",
                                      style: TextStyle(color: Color(0xff0A66C2)),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        indent: 10.0,
                                        endIndent: 20.0,
                                        thickness: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Already have an account?"),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const LoginPage(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "SignIn",
                                        style: TextStyle(
                                          color: Color(0xff0A66C2),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
