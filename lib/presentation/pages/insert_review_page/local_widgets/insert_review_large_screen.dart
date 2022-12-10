import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/hrUserprovider.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/drop_down_widget.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/input_data_fields.dart';

import '../../../../business_logic/providers/identity_card_type_selection.dart';

class InsertReviewLargeScreen extends StatefulWidget {
  const InsertReviewLargeScreen({super.key});

  @override
  State<InsertReviewLargeScreen> createState() => _InsertReviewLargeScreenState();
}

class _InsertReviewLargeScreenState extends State<InsertReviewLargeScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final nicPassportController = TextEditingController();
  final countryController = TextEditingController();
  late var submittedByController = TextEditingController();
  final submittionTitleController = TextEditingController();
  final submittionDiscriptionController = TextEditingController();
  final submittionReasonController = TextEditingController();
  final organizationController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    countryController.dispose();
    submittedByController.dispose();
    submittionTitleController.dispose();
    submittionDiscriptionController.dispose();
    submittionReasonController.dispose();
    organizationController.dispose();
    super.dispose();
  }

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

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  void initState() {
  //  submittedByController.text = context.read<HrProvider>().hrUser.firstName! + context.read<HrProvider>().hrUser.lastName!;
    // print(submittedByController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputDataFields(
                    fieldName: 'First Name',
                    fullWidth: false,
                    controller: firstNameController,
                    validator: RequiredValidator(errorText: 'Required!'),
                  ),
                  InputDataFields(
                    fieldName: 'Last Name',
                    fullWidth: false,
                    controller: lastNameController,
                    validator: RequiredValidator(errorText: 'Required!'),
                  ),
                  InputDataFields(
                    fieldName: 'Email',
                    fullWidth: false,
                    controller: emailController,
                    validator: RequiredValidator(errorText: 'Required!'),
                  ),
                  DropDownCustomWidget(
                    fullWidth: false,
                    controller: nicPassportController,
                    validator: RequiredValidator(errorText: 'Required!'),
                  ),
                  InputDataFields(
                    fieldName: 'Phone / Mobile',
                    fullWidth: false,
                    controller: phoneNumberController,
                    validator: RequiredValidator(errorText: 'Required!'),
                  ),
                  InputDataFields(
                    fieldName: 'Country',
                    fullWidth: false,
                    controller: countryController,
                    validator: RequiredValidator(errorText: 'Required!'),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputDataFields(
                    fieldName: 'Submitted by',
                    fullWidth: false,
                    controller: submittedByController,
                    validator: RequiredValidator(errorText: 'Required!'),
                  ),
                  InputDataFields(
                    fieldName: 'Submission Title',
                    fullWidth: false,
                    controller: submittionTitleController,
                    validator: RequiredValidator(errorText: 'Required!'),
                  ),
                  InputDataFields(
                    fieldName: 'Submission Discription',
                    fullWidth: false,
                    controller: submittionDiscriptionController,
                    validator: RequiredValidator(errorText: 'Required!'),
                  ),
                  InputDataFields(
                    fieldName: 'Reason of Submission',
                    fullWidth: false,
                    controller: submittionReasonController,
                    validator: RequiredValidator(errorText: 'Required!'),
                  ),
                  InputDataFields(
                    fieldName: 'Organization',
                    fullWidth: false,
                    controller: organizationController,
                    validator: RequiredValidator(errorText: 'Required!'),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: const Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    "https://cdn.logo.com/hotlink-ok/logo-social.png",
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {
                                // if (_key.currentState?.validate() == false) {
                                //   _failSnackbar('Invalid Credentials');
                                // } else {
                                //   if (context.read<IdentityCardTypeSelection>().selectedItem == "Passport") {
                                //     context.read<HrProvider>().SubmitEmployeeProfile(
                                //           firstNameController.text,
                                //           lastNameController.text,
                                //           emailController.text,
                                //           phoneNumberController.text,
                                //           nicPassportController.text,
                                //           countryController.text,
                                //           submittedByController.text,
                                //           submittionTitleController.text,
                                //           submittionDiscriptionController.text,
                                //           submittionReasonController.text,
                                //           organizationController.text,
                                //           context.read<HrProvider>().hrUser.userId!,
                                //           "Passport",
                                //         );
                                //   } else {
                                //     context.read<HrProvider>().SubmitEmployeeProfile(
                                //           firstNameController.text,
                                //           lastNameController.text,
                                //           emailController.text,
                                //           phoneNumberController.text,
                                //           nicPassportController.text,
                                //           countryController.text,
                                //           submittedByController.text,
                                //           submittionTitleController.text,
                                //           submittionDiscriptionController.text,
                                //           submittionReasonController.text,
                                //           organizationController.text,
                                //           context.read<HrProvider>().hrUser.userId!,
                                //           "NIC",
                                //         );
                                //   }

                                //   // context)
                                //   //     .read<HrProvider>()
                                //   //     .SubmitEmployeeProfile(
                                //   //       firstNameController.text,
                                //   //       lastNameController.text,
                                //   //       emailController.text,
                                //   //       phoneNumberController.text,
                                //   //       nicPassportController.text,
                                //   //       countryController.text,
                                //   //       submittedByController.text,
                                //   //       submittionTitleController.text,
                                //   //       submittionDiscriptionController.text,
                                //   //       submittionReasonController.text,
                                //   //       organizationController.text,
                                //   //       context
                                //   //           .read<HrProvider>()
                                //   //           .hrUser
                                //   //           .user_id!,
                                //   //     );
                                // }
                                // print(firstNameController.text);
                                // firstNameController.clear();
                                // print(lastNameController.text);
                                // lastNameController.clear();
                                // print(emailController.text);
                                // emailController.clear();
                                // print(nicPassportController.text);
                                // nicPassportController.clear();
                                // print(phoneNumberController.text);
                                // phoneNumberController.clear();
                                // print(countryController.text);
                                // countryController.clear();
                                // print(submittedByController.text);
                                // submittedByController.clear();
                                // print(submittionTitleController.text);
                                // submittionTitleController.clear();
                                // print(submittionDiscriptionController.text);
                                // submittionDiscriptionController.clear();
                                // print(submittionReasonController.text);
                                // submittionReasonController.clear();
                                // print(organizationController.text);
                                // organizationController.clear();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff0A66C2),
                                elevation: 10,
                              ),
                              child: const Text(
                                "SUBMIT",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
