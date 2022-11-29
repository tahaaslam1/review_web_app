// ignore: file_names
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.45,
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
                        // if (empNameController.text != '' &&
                        //     reviewController.text != '') {
                        //   _tryInsertReview(
                        //       empNameController.text,
                        //       reviewController.text,
                        //       ratingController);

                        //   empNameController.clear();
                        //   reviewController.clear();
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0A66C2),
                        elevation: 10,
                      ),
                      child: const Text(
                        "POST",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                          //height: 2.00,
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
    );
  }
}