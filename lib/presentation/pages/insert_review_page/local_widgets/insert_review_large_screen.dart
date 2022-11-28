import 'package:flutter/material.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/button_widget.dart';
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
              children: const  [
                InputDataFields('First Name'),
                InputDataFields('Last Name'),
                InputDataFields('Email'),
                InputDataFields('Passport'),
                InputDataFields('NIC'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                InputDataFields('Submitted by'),
                InputDataFields('Phone / Mobile'),
                InputDataFields('Reason of Submission'),
                InputDataFields('Submission Title'),
                InputDataFields('Organization'),
              ],
            ),
          ],
        ),
        const InputDataFields('Submission Discription'),
        const SizedBox(
          height: 20,
        ),
        const ButtonWidget()
      ],
    );
  }
}
