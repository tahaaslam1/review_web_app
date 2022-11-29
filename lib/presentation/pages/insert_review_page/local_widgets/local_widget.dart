import 'package:flutter/material.dart';

class InputDataFields extends StatelessWidget {
  final String fieldName;
  const InputDataFields(this.fieldName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldName,
            style: const TextStyle(
              color: Color.fromARGB(255, 90, 96, 101),
              // fontSize: MediaQuery.of(context).size.width * 0.01,
              fontSize: 20,
              fontWeight: FontWeight.w200,
              letterSpacing: 0.5,
              height: 2.00,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: const TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
        ],
      ),
    );
  }
}
