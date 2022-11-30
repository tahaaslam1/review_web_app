import 'package:flutter/material.dart';

class EmployeeInfoWidget extends StatelessWidget {
  final String empName;
  final String empOrganization;
  final String submissonTitle;
  final String submissionDescription;
  const EmployeeInfoWidget({
    Key? key,
    required this.empName,
    required this.empOrganization,
    required this.submissonTitle,
    required this.submissionDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      empName,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      empOrganization,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Text(
                  submissonTitle,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  submissionDescription,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
