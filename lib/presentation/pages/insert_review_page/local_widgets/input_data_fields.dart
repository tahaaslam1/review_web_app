import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/hrUserprovider.dart';

class InputDataFields extends StatelessWidget {
  final String fieldName;
  final bool fullWidth;
  final TextEditingController controller;
  final RequiredValidator validator;
  const InputDataFields(
      {super.key,
      required this.fieldName,
      required this.fullWidth,
      required this.controller,
      required this.validator});

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
                    validator: RequiredValidator(errorText: "Required!"),
                  )
                : TextFormField(
                    decoration: InputDecoration(
                      enabled: false,
                      border: OutlineInputBorder(),
                      hintText: context.read<HrProvider>().hr.firstName! +
                          " " +
                          context.read<HrProvider>().hr.lastName!,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
