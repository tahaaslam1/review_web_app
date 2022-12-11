import 'package:flutter/material.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/insert_review_large_screen.dart';
import 'package:review_web_app/presentation/pages/insert_review_page/local_widgets/insert_review_screen.dart';

class InsertReviewPage extends StatelessWidget {
  static const String route = 'insert-review-page';

  const InsertReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    var isLargeScreen = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Insert Review"),
        backgroundColor: Color(0xFF0A66C2),
        automaticallyImplyLeading: false,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (MediaQuery.of(context).size.width > 600) {
            isLargeScreen = true;
          } else {
            isLargeScreen = false;
          }
          return SingleChildScrollView(
            child: isLargeScreen
                ? const InsertReviewLargeScreen()
                : const InsertReviewSmallScreen(),
          );
        },
      ),
    );
  }
}
