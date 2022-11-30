import 'package:flutter/material.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/drop_down_widget.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/input_data_fields.dart';

const List<String> list = <String>['National Identity Card', 'Passport'];

class InsertReviewScreen extends StatefulWidget {
  const InsertReviewScreen({
    super.key,
  });

  @override
  State<InsertReviewScreen> createState() => _InsertReviewScreenState();
}

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

class _InsertReviewScreenState extends State<InsertReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SizedBox(
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InputDataFields(
                    fieldName: 'First Name',
                    fullWidth: false,
                    controller: firstNameController,
                  ),
                  InputDataFields(
                    fieldName: 'Last Name',
                    fullWidth: false,
                    controller: lastNameController,
                  ),
                  InputDataFields(
                    fieldName: 'Email',
                    fullWidth: false,
                    controller: emailController,
                  ),
                  DropDownCustomWidget(
                    fullWidth: false,
                    controller: nicPassportController
                  ),
                  InputDataFields(
                    fieldName: 'Phone / Mobile',
                    fullWidth: false,
                    controller: phoneNumberController,
                  ),
                  InputDataFields(
                    fieldName: 'Country',
                    fullWidth: false,
                    controller: countryController,
                  ),
                  InputDataFields(
                    fieldName: 'Submitted by',
                    fullWidth: false,
                    controller: submittedByController,
                  ),
                  InputDataFields(
                    fieldName: 'Submission Title',
                    fullWidth: false,
                    controller: submittionTitleController,
                  ),
                  InputDataFields(
                    fieldName: 'Submission Discription',
                    fullWidth: false,
                    controller: submittionDiscriptionController,
                  ),
                  InputDataFields(
                    fieldName: 'Reason of Submission',
                    fullWidth: false,
                    controller: submittionReasonController,
                  ),
                  InputDataFields(
                    fieldName: 'Organization',
                    fullWidth: false,
                    controller: organizationController,
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
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: () {
                                    print(firstNameController.text);
                                    firstNameController.clear();
                                    print(lastNameController.text);
                                    lastNameController.clear();
                                    print(emailController.text);
                                    emailController.clear();
                                    print(nicPassportController.text);
                                    nicPassportController.clear();
                                    print(phoneNumberController.text);
                                    phoneNumberController.clear();
                                    print(countryController.text);
                                    countryController.clear();
                                    print(submittedByController.text);
                                    submittedByController.clear();
                                    print(submittionTitleController.text);
                                    submittionTitleController.clear();
                                    print(submittionDiscriptionController.text);
                                    submittionDiscriptionController.clear();
                                    print(submittionReasonController.text);
                                    submittionReasonController.clear();
                                    print(organizationController.text);
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
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
