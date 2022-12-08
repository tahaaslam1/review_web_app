import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_web_app/business_logic/providers/admin_provider.dart';
import 'package:review_web_app/presentation/pages/accept-reject-screen/local_widgets/accept_reject_widget.dart';
import 'package:review_web_app/presentation/pages/view_profile_page/view_profile_admin_page.dart';

class AcceptRejectPage extends StatelessWidget {
  static const String route = 'accept-reject';
  const AcceptRejectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AdminProvider>(
        builder: (context, provider, _) {
          if (!provider.loading) {
            return ListView.builder(
              itemCount: provider.allUnapproved.length,
              itemBuilder: ((BuildContext context, index) {
                return AcceptRejectWidget(
                  user_id: provider.allUnapproved[index].userId,
                  firstname: provider.allUnapproved[index].firstName,
                  lastname: provider.allUnapproved[index].lastName,
                  organisation: provider.allUnapproved[index].organisation,
                );
              }),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
