import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/admin_provide.dart';
import 'package:review_web_app/presentation/pages/view_profile_page/view_profile_admin.dart';


class AcceptReject extends StatelessWidget {
  static const String route = 'accept-reject';
  const AcceptReject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<AdminProvider>(builder: (context, provider, _) {
      if (!provider.loading) {
        return ListView.builder(
          itemCount: provider.allUnapproved.length,
          itemBuilder: ((BuildContext context, index) {
            return accept_reject_widget(
              user_id: provider.allUnapproved[index].user_id,
              firstname: provider.allUnapproved[index].first_name,
              lastname: provider.allUnapproved[index].last_name,
              organisation: provider.allUnapproved[index].organisation,
            );
          }),
        );
      } else {
        return CircularProgressIndicator();
      }
    }));
  }
}

class accept_reject_widget extends StatelessWidget {
  String? firstname;
  String? lastname;
  String? organisation;
  String? user_id;
  accept_reject_widget({
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
              leading: Icon(Icons.album),
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
                      await context.read<AdminProvider>().AcceptUser(user_id!);
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewProfileAdmin(user_id: user_id!),
                      ),
                    );
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
