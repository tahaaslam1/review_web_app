import 'package:flutter/material.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/button_widget.dart';
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
                children: const [
                  InputDataFields(
                    fieldName: 'First Name',
                    fullWidth: true,
                  ),
                  InputDataFields(
                    fieldName: 'Last Name',
                    fullWidth: true,
                  ),
                  InputDataFields(
                    fieldName: 'Email',
                    fullWidth: true,
                  ),
                  DropDownCustomWidget(fullWidth: true,),
                  InputDataFields(
                    fieldName: 'Phone / Mobile',
                    fullWidth: true,
                  ),
                  InputDataFields(
                    fieldName: 'Submitted by',
                    fullWidth: true,
                  ),
                  InputDataFields(
                    fieldName: 'Submission Title',
                    fullWidth: true,
                  ),
                  InputDataFields(
                    fieldName: 'Submission Discription',
                    fullWidth: true,
                  ),
                  InputDataFields(
                    fieldName: 'Reason of Submission',
                    fullWidth: true,
                  ),
                  InputDataFields(
                    fieldName: 'Organization',
                    fullWidth: true,
                  ),
                  InputDataFields(
                    fieldName: 'Country',
                    fullWidth: true,
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Center(
                child: ButtonWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
