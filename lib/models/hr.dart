import 'package:review_web_app/models/user.dart';

class HR extends User {
  String? adminId; //TODO : staring me null then , after approve filled...
  String? country;
  String? organisation;
  String? phone;
  bool? isApproved;

  HR({
    required super.firstName,
    required super.email,
    required super.lastName,
    required super.userId,
    required super.userType,
    this.adminId,
    this.country,
    this.isApproved,
    this.organisation,
    this.phone,
  });

  factory HR.fromJson(Map<String, dynamic> json) {
    return HR(
        userId: json['user_id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        organisation: json['organisation'],
        phone: json['phone'],
        userType: UserType.hr,
        isApproved: json['is_approved'],
        country: json['country']);
  }

  // HR(this.adminId, this.country, this.organisation, this.phone, this.isApproved);
}












// class HR {
//   late String? first_name;
//   late  String? user_id;
//    String? adminId;
//   late String? country;
//   late String? last_name;
//    String? email;
//   late String? organisation;
//   late String? phone;
//    int? type_id;
//    String? password;
//   late bool? is_approved;

//   HR({
//     this.first_name,
//     this.last_name,
//     this.adminId,
//     this.email,
//     this.organisation,
//     this.phone,
//     this.user_id,
//     this.type_id,
//     this.country,
//     this.password,
//     this.is_approved,
//   });

//   factory HR.fromJson(Map<String, dynamic> json) {
//     return HR(
//         first_name: json['first_name'],
//         last_name: json['last_name'],
//         user_id: json['user_id'],
//         email: json['email'],
//         password: json['password'],
//         organisation: json['organisation'],
//         phone: json['phone'],
//         adminId: json['admin_id'],
//         type_id: json['type_id'],
//         country: json['country'],
//         is_approved: json['is_approved']);
//   }
// }
