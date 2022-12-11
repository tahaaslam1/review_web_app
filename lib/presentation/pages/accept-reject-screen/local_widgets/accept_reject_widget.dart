import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/admin_provider.dart';
import 'package:review_web_app/business_logic/providers/auth_provider.dart';
import 'package:review_web_app/presentation/pages/view_profile_page/view_profile_admin_page.dart';
import 'package:review_web_app/routes/router.gr.dart';

class AcceptRejectWidget extends StatelessWidget {
  String? firstname;
  String? lastname;
  String? organisation;
  String? user_id;
  AcceptRejectWidget({
    this.firstname,
    this.lastname,
    this.organisation,
    this.user_id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 500,
        height: 100,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.album),
              title: Text(firstname! + lastname!),
              subtitle: Text(organisation!),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      await context.read<AdminProvider>().AcceptUser(
                          user_id!,
                          Provider.of<AuthProvider>(context, listen: false)
                              .user
                              .userId!);
                    },
                    child: const Text('Accept'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      await context.read<AdminProvider>().RejectUser(user_id!);
                    },
                    child: const Text('Reject'),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    context.router.push(ViewProfileAdminRoute(
                      userId: user_id
                    ));
                  },
                  child: const Text('View Profile'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
