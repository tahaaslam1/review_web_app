
import 'package:flutter/material.dart';


class AcceptReject extends StatelessWidget {
  static const String route = 'accept-reject';
  const AcceptReject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
            accept_reject_widget(),
            accept_reject_widget(),
            accept_reject_widget(),
            accept_reject_widget(),
            accept_reject_widget(),
            
        ],
      ),
    );
  }
}

class accept_reject_widget extends StatelessWidget {
  const accept_reject_widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card (child: SizedBox(
      width: 500,
      height: 100,
        child: Column(
          children: [
             ListTile(
              leading: Icon(Icons.album),
              title: Text('Shahee Khan'),
              subtitle: Text('Backend Developer at Tixsee LLC'),
            ),
            Row(
               
               mainAxisAlignment: MainAxisAlignment.end,
               children:[
            //        ListTile(
            //   leading: Icon(Icons.album),
            //   title: Text('Areeb Baig'),
            //   subtitle: Text('Backend Developer at Tixsee LLC'),
            // ),
                 Padding(
                   padding: const EdgeInsets.only(right: 10.0),
                   child: ElevatedButton(
                    onPressed: () { },
                    child: const Text('Accept'),
              ),
                 ),
              
               Padding(
                 padding: const EdgeInsets.only(right:5.0),
                 child: ElevatedButton(
                    onPressed: () { },
                    child: const Text('Reject'),
              ),
               ),
              ]
            ),
          ],
        ),
      
    ),

    );
  }
}
