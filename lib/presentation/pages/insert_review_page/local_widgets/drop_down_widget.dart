import 'package:flutter/material.dart';

class DropDownCustomWidget extends StatefulWidget {
  final bool fullWidth;
  const DropDownCustomWidget({super.key, required this.fullWidth});

  @override
  State<DropDownCustomWidget> createState() => _DropDownCustomWidgetState();
}

class _DropDownCustomWidgetState extends State<DropDownCustomWidget> {
  List<String> items = ['National Identity Card', 'Passport'];
  String? selectedItem = 'National Identity Card';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          SizedBox(
            width: widget.fullWidth
                ? MediaQuery.of(context).size.width * 0.9
                : MediaQuery.of(context).size.width * 0.3,
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                  border: InputBorder.none, fillColor: null),
              value: selectedItem,
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 90, 96, 101),
                            fontSize: 15,
                            fontWeight: FontWeight.w200,
                            letterSpacing: 0.5,
                            height: 2.00,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (item) {
                setState(() {
                  selectedItem = item;
                });
              },
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
              )),
        ],
      ),
    );
  }
}
