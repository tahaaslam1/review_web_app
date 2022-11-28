import 'package:flutter/material.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/insert_review_large_screen.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/insert_review_screen.dart';

class InsertReview extends StatelessWidget {
  static const String route = 'insert-review-page';

  const InsertReview({super.key});

  @override
  Widget build(BuildContext context) {
    var isLargeScreen = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Insert Review"),
        backgroundColor: Colors.black
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        
        if (MediaQuery.of(context).size.width > 600) {
          isLargeScreen = true;
        } else {
          isLargeScreen = false;
        }

        return SingleChildScrollView(child:
          isLargeScreen ? const InsertReviewLargeScreen() : const InsertReviewScreen(),
        );
      }),
    );
  }
}
