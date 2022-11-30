import 'package:flutter/material.dart';

class InputDataFields extends StatelessWidget {
  final String fieldName;
  final bool fullWidth;
  final TextEditingController controller;
  const InputDataFields(
      {super.key, required this.fieldName, required this.fullWidth, required this.controller});

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
              fontSize: 15,
              fontWeight: FontWeight.w200,
              letterSpacing: 0.5,
              height: 2.00,
            ),
          ),
          const SizedBox(
            height: 0.1,
          ),
          SizedBox(
            width: fullWidth
                ? MediaQuery.of(context).size.width * 0.9
                : MediaQuery.of(context).size.width * 0.3,
            child: !(fieldName == 'Submitted by')
                ? TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    controller: controller,
                  )
                : TextFormField(
                    decoration: const InputDecoration(
                      enabled: false,
                      border: OutlineInputBorder(),
                      hintText: 'User Name',
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
