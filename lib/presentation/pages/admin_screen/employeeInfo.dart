// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:provider/provider.dart';

// class EmployeeInfo extends StatelessWidget {
//   EmployeeInfo({super.key});
//   TextEditingController _name = new TextEditingController();

//   TextEditingController _email = new TextEditingController();

//   TextEditingController _country = new TextEditingController();

//   TextEditingController _phone = new TextEditingController();

//   TextEditingController _nid = new TextEditingController();

//   TextEditingController _organisation = new TextEditingController();
//   TextEditingController _subtype = new TextEditingController();
//   TextEditingController _subres = new TextEditingController();
//   TextEditingController _subby = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: TextFormField(
//               controller: _name,
//               decoration: InputDecoration(
//                 icon: Icon(Icons.person),
//                 labelText: "Enter Name",
//                 labelStyle: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w100,
//                 ),
//                 fillColor: Colors.white,
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: BorderSide(
//                     color: Colors.blue,
//                     width: 2.0,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: TextFormField(
//               controller: _email,
//               decoration: InputDecoration(
//                 icon: Icon(Icons.email),
//                 labelText: "Email",
//                 labelStyle: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w100,
//                 ),
//                 fillColor: Colors.white,
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: BorderSide(
//                     color: Colors.blue,
//                     width: 2.0,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: TextFormField(
//               controller: _organisation,
//               decoration: InputDecoration(
//                 icon: Icon(Icons.people),
//                 labelText: "Organisation",
//                 labelStyle: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w100,
//                 ),
//                 fillColor: Colors.white,
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: BorderSide(
//                     color: Colors.blue,
//                     width: 2.0,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: TextFormField(
//               controller: _phone,
//               decoration: InputDecoration(
//                 icon: Icon(Icons.phone),
//                 labelText: "Phone",
//                 labelStyle: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w100,
//                 ),
//                 fillColor: Colors.white,
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: BorderSide(
//                     color: Colors.blue,
//                     width: 2.0,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: TextFormField(
//               controller: _country,
//               decoration: InputDecoration(
//                 icon: Icon(Icons.location_on),
//                 labelText: "Country",
//                 labelStyle: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w100,
//                 ),
//                 fillColor: Colors.white,
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: BorderSide(
//                     color: Colors.blue,
//                     width: 2.0,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: TextFormField(
//               controller: _subtype,
//               decoration: InputDecoration(
//                 icon: Icon(Icons.description),
//                 labelText: "Submission type",
//                 labelStyle: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w100,
//                 ),
//                 fillColor: Colors.white,
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: BorderSide(
//                     color: Colors.blue,
//                     width: 2.0,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: TextFormField(
//               controller: _subres,
//               decoration: InputDecoration(
//                 icon: Icon(Icons.location_on),
//                 labelText: "Reason For Submission",
//                 labelStyle: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w100,
//                 ),
//                 fillColor: Colors.white,
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: BorderSide(
//                     color: Colors.blue,
//                     width: 2.0,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: TextFormField(
//               controller: _subby,
//               decoration: InputDecoration(
//                 icon: Icon(Icons.location_on),
//                 labelText: "Submitted By:",
//                 labelStyle: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w100,
//                 ),
//                 fillColor: Colors.white,
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: BorderSide(
//                     color: Colors.blue,
//                     width: 2.0,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: TextFormField(
//               controller: _nid,
//               decoration: InputDecoration(
//                 icon: Icon(Icons.location_on),
//                 labelText: "National ID",
//                 labelStyle: TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w100,
//                 ),
//                 fillColor: Colors.white,
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: BorderSide(
//                     color: Colors.blue,
//                     width: 2.0,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Center(
//             child: ElevatedButton(
//                 onPressed: () {
//                   // provider.saveNewEmployee(Employee(
//                   //   username: _name.text,
//                   //   review: _subres.text,
//                   //   rating: "1",
//                   // ));
//                 },
//                 child: Text("Save")),
//           )
//         ],
//       ),
//     );
//     // return Container(
//     //   child: SingleChildScrollView(
//     //     child: Consumer<AdminController>(
//     //       builder: (context, provider, _) {
//     //         return
//     //       },
//     //     ),
//     //   ),
//     // );
//   }
// }
