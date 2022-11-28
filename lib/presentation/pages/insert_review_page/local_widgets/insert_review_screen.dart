import 'package:flutter/material.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/button_widget.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/local_widget.dart';

class InsertReviewPage extends StatefulWidget {
  const InsertReviewPage({
    super.key,
  });

  @override
  State<InsertReviewPage> createState() => _InsertReviewPageState();
}

class _InsertReviewPageState extends State<InsertReviewPage> {
  // void _failSnackbar(String error) {
  //   final snackBar = SnackBar(
  //     behavior: SnackBarBehavior.floating,
  //     content: Text(
  //       error,
  //       textAlign: TextAlign.center,
  //       style: TextStyle(),
  //     ),
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  // void _tryInsertReview(
  //     String empName, String review, double ratingController) async {
  //   try {
  //     var response = await widget.user?.tryInsertingReview(
  //         widget.user, empName, review, ratingController.toString());
  //     if (response == 200) {
  //       _failSnackbar('Review posted');
  //     }
  //   } catch (e) {
  //     _failSnackbar(e.toString());
  //   }
  // }

  // TextEditingController empNameController = TextEditingController();

  // TextEditingController reviewController = TextEditingController();

  // double ratingController = 0;

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
