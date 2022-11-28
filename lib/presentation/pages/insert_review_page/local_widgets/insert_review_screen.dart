import 'package:flutter/material.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/button_widget.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/input_data_fields.dart';

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  InputDataFields('First Name'),
                  InputDataFields('Last Name'),
                  InputDataFields('Email'),
                  InputDataFields('Passport'),
                  InputDataFields('NIC'),
                  InputDataFields('Organization'),
                  InputDataFields('Submitted by'),
                  InputDataFields('Phone / Mobile'),
                  InputDataFields('Reason of Submission'),
                  InputDataFields('Submission Title'),
                  InputDataFields('Submission Discription'),
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
