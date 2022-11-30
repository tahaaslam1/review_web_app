import 'package:flutter/material.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/button_widget.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/drop_down_widget.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/input_data_fields.dart';

class InsertReviewLargeScreen extends StatelessWidget {
  const InsertReviewLargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                InputDataFields(
                  fieldName: 'First Name',
                  fullWidth: false,
                ),
                InputDataFields(
                  fieldName: 'Last Name',
                  fullWidth: false,
                ),
                InputDataFields(
                  fieldName: 'Email',
                  fullWidth: false,
                ),
                DropDownCustomWidget(
                  fullWidth: false,
                ),
                InputDataFields(
                  fieldName: 'Phone / Mobile',
                  fullWidth: false,
                ),
                InputDataFields(
                  fieldName: 'Country',
                  fullWidth: false,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                InputDataFields(
                  fieldName: 'Submitted by',
                  fullWidth: false,
                ),
                InputDataFields(
                  fieldName: 'Submission Title',
                  fullWidth: false,
                ),
                InputDataFields(
                  fieldName: 'Submission Discription',
                  fullWidth: false,
                ),
                InputDataFields(
                  fieldName: 'Reason of Submission',
                  fullWidth: false,
                ),
                InputDataFields(
                  fieldName: 'Organization',
                  fullWidth: false,
                ),
                // SizedBox(
                //   height: 120,
                // )
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
        const ButtonWidget()
      ],
    );
  }
}
