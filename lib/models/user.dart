import 'package:review_web_app/models/admin.dart';
import 'package:review_web_app/models/hr.dart';

enum UserType { guest, admin, hr ,unknown}

class User {
  String? firstName;
  String? lastName;
  final String? userId;
  final UserType? userType;
  final String? email;

  User({
    required this.firstName,
    required this.lastName,
    required this.userId,
    required this.email,
    required this.userType,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    if (json["user_type"] == 1) {
      return Admin(
        firstName: json['first_name'],
        lastName: json['last_name'],
        userId: json['user_id'],
        email: json['email'],
        userType: UserType.admin,
      );
    } else {
      return HR(
        firstName: json['first_name'],
        lastName: json['last_name'],
        userId: json['user_id'],
        email: json['email'],
        organisation: json['organisation'],
        phone: json['phone'],
        adminId: json['admin_id'],
        country: json['country'],
        isApproved: json['is_approved'],
        userType: UserType.hr,
      );
    }

    // HR(this.adminId, this.country, this.organisation, this.phone, this.isApproved);
  }

  //static const empty = User(email: '-', firstName: '-', lastName: '-', userId: '-', userType: UserType.guest);
  //User(this.first_name, this.user_id, this.adminId, this.country, this.last_name, this.email, this.organisation, this.phone, this.type_id, this.password, this.is_approved);
}
