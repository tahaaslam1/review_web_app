import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/identity_card_type_selection.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/drop_down_widget.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/input_data_fields.dart';
import 'package:form_field_validator/form_field_validator.dart';

const List<String> list = <String>['National Identity Card', 'Passport'];

class InsertReviewSmallScreen extends StatefulWidget {
  const InsertReviewSmallScreen({
    super.key,
  });

  @override
  State<InsertReviewSmallScreen> createState() => _InsertReviewSmallScreenState();
}

class _InsertReviewSmallScreenState extends State<InsertReviewSmallScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final nicPassportController = TextEditingController();
  final countryController = TextEditingController();
  final submittedByController = TextEditingController();
  final submittionTitleController = TextEditingController();
  final submittionDiscriptionController = TextEditingController();
  final submittionReasonController = TextEditingController();
  final organizationController = TextEditingController();

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
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SizedBox(
          width: 500,
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InputDataFields(
                      fieldName: 'First Name',
                      fullWidth: true,
                      controller: firstNameController,
                      validator: RequiredValidator(errorText: 'Required!'),
                    ),
                    InputDataFields(
                      fieldName: 'Last Name',
                      fullWidth: true,
                      controller: lastNameController,
                      validator: RequiredValidator(errorText: 'Required!'),
                    ),
                    InputDataFields(
                      fieldName: 'Email',
                      fullWidth: true,
                      controller: emailController,
                      validator: RequiredValidator(errorText: 'Required!'),
                    ),
                    DropDownCustomWidget(
                      fullWidth: true,
                      controller: nicPassportController,
                      validator: RequiredValidator(errorText: 'Required!'),
                    ),
                    InputDataFields(
                      fieldName: 'Phone / Mobile',
                      fullWidth: true,
                      controller: phoneNumberController,
                      validator: RequiredValidator(errorText: 'Required!'),
                    ),
                    InputDataFields(
                      fieldName: 'Country',
                      fullWidth: true,
                      controller: countryController,
                      validator: RequiredValidator(errorText: 'Required!'),
                    ),
                    InputDataFields(
                      fieldName: 'Submitted by',
                      fullWidth: true,
                      controller: submittedByController,
                      validator: RequiredValidator(errorText: 'Required!'),
                    ),
                    InputDataFields(
                      fieldName: 'Submission Title',
                      fullWidth: true,
                      controller: submittionTitleController,
                      validator: RequiredValidator(errorText: 'Required!'),
                    ),
                    InputDataFields(
                      fieldName: 'Submission Discription',
                      fullWidth: true,
                      controller: submittionDiscriptionController,
                      validator: RequiredValidator(errorText: 'Required!'),
                    ),
                    InputDataFields(
                      fieldName: 'Reason of Submission',
                      fullWidth: true,
                      controller: submittionReasonController,
                      validator: RequiredValidator(errorText: 'Required!'),
                    ),
                    InputDataFields(
                      fieldName: 'Organization',
                      fullWidth: true,
                      controller: organizationController,
                      validator: RequiredValidator(errorText: 'Required!'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                  // child: ButtonWidget(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Column(
                        children: [
                          Consumer<IdentityCardTypeSelection>(
                            builder: (context, provider, _) {
                              return Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: SizedBox(
                                      height: 45,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (_key.currentState?.validate() == false) {
                                            _failSnackbar('Invalid Credentials');
                                          }
                                          firstNameController.clear();
                                          lastNameController.clear();
                                          emailController.clear();
                                          nicPassportController.clear();
                                          phoneNumberController.clear();
                                          countryController.clear();
                                          submittedByController.clear();
                                          submittionTitleController.clear();
                                          submittionDiscriptionController.clear();
                                          submittionReasonController.clear();
                                          organizationController.clear();
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
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
