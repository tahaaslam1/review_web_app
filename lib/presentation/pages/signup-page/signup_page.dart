// import 'package:checkapp/controller/userController.dart';
// import 'package:checkapp/screens/companyRegisterPage.dart';
// import 'package:checkapp/screens/loginPage.dart';
// import 'package:checkapp/screens/companiesPage.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
// import 'package:review_web_app/loginPage.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/presentation/pages/login_page/login_page.dart';

// UserController _user = UserController();

class SignUpPage extends StatefulWidget {
  static const String route = 'Signup-page';
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

  // void _tryRegister(String email, String username, String password) async {
  //   try {
  //     var response = await _user.trySignup(email, username, password);
  //     // ignore: use_build_context_synchronously
  //     if (response == 200) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => CompanyDetails(
  //             user: _user,
  //           ),
  //         ),
  //       );
  //       emailController.clear();
  //       usernameController.clear();
  //       passwordController.clear();
  //     } else {
  //       _failSnackbar('email already registered');
  //     }
  //   } catch (e) {
  //     _failSnackbar(e.toString());
  //   }
  // }

  TextEditingController companynameController = TextEditingController();

  TextEditingController countrynameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController firstameController = TextEditingController();

  TextEditingController lastameController = TextEditingController();

  TextEditingController phnumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 247, 246),
        // actions: [
        //   Row(

        //     children: [
        //       // const Padding(
        //       //   padding: EdgeInsets.all(5),
        //       //   child: Text(
        //       //     ,
        //       //     style:
        //       //         TextStyle(color: Color(0xff0A66C2), fontFamily: 'Anton'),
        //       //   ),
        //       // ),
        //       // Padding(
        //       //   padding: const EdgeInsets.all(10),
        //       //   child: IconButton(
        //       //     tooltip: "read review",
        //       //     onPressed: () async {
        //       //       await context.read<CompanyController>().GetCompnies();
        //       //       // ignore: use_build_context_synchronously
        //       //       Navigator.push(
        //       //         context,
        //       //         MaterialPageRoute(
        //       //           builder: (context) => CompaniesPage(),
        //       //         ),
        //       //       );
        //       //       //  tryGettingComp(context);
        //       //     },
        //       //     icon: const Icon(
        //       //       Icons.rate_review_outlined,
        //       //       color: Color(0xff0A66C2),
        //       //     ),
        //       //   ),
        //       // ),
        //     ],
        //   ),
        // ],
        automaticallyImplyLeading: false,
        title: const Text(
          "Review US",
          style: TextStyle(
            color: Color(0xff0A66C2),
            fontFamily: 'Anton',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'First Name'),
                            controller: firstameController,
                            validator:
                                RequiredValidator(errorText: "Required*"),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Last Name'),
                            controller: lastameController,
                            validator:
                                RequiredValidator(errorText: "Required*"),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Company Name'),
                            controller: companynameController,
                            validator:
                                RequiredValidator(errorText: "Required*"),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Phone Number'),
                            controller: phnumberController,
                            validator:
                                RequiredValidator(errorText: "Required*"),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Country'),
                            controller: countrynameController,
                            validator:
                                RequiredValidator(errorText: "Required*"),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Email'),
                            controller: emailController,
                            validator:
                                EmailValidator(errorText: "wrong email format"),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Password'),
                            controller: passwordController,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: SizedBox(
                            height: 50,
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formkey.currentState?.validate() ==
                                    false) {
                                  _failSnackbar('Invalid Credentials');
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                  );
                                  // Navigator.pop(context, _failSnackbar('Invalid Credentials');

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
                                  //height: 2.00,
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
                                    builder: (context) => LoginPage(),
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
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
