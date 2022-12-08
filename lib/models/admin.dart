import 'package:review_web_app/models/user.dart';

class Admin extends User {
  Admin({
    required super.firstName,
    required super.lastName,
    required super.userId,
    required super.email,
    required super.userType,
  });
}
