import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

import '../../../../business_logic/providers/identity_card_type_selection.dart';

class DropDownCustomWidget extends StatefulWidget {
  final bool fullWidth;
  final TextEditingController controller;
  final RequiredValidator validator;
  const DropDownCustomWidget({super.key, required this.fullWidth, required this.controller, required this.validator});

  @override
  State<DropDownCustomWidget> createState() => _DropDownCustomWidgetState();
}

class _DropDownCustomWidgetState extends State<DropDownCustomWidget> {
  // List<String> items = ['National Identity Card', 'Passport'];
  // String? selectedItem = 'National Identity Card';
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: 
      Consumer<IdentityCardTypeSelection>(builder: ((context,provider, _) {
        return
        Column(
        children: [
          SizedBox(
            width: widget.fullWidth
                ? MediaQuery.of(context).size.width * 0.9
                : MediaQuery.of(context).size.width * 0.3,
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                  border: InputBorder.none, fillColor: null),
              value: context.watch<IdentityCardTypeSelection>().selectedItem,
              items: context.watch<IdentityCardTypeSelection>().items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 90, 96, 101),
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                            letterSpacing: 0.5,
                            height: 1.5,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: ((value) => provider.updateSelectedItem(value))
            ),
          ),
          const SizedBox(
            height: 0.1,
          ),
          SizedBox(
              width: widget.fullWidth
                  ? MediaQuery.of(context).size.width * 0.9
                  : MediaQuery.of(context).size.width * 0.3,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                controller: widget.controller,
                validator: widget.validator,
              )),
        ],
      );
      } ),)
      
    );
  }
}
