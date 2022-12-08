enum UserType { guest, admin, hr }

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

  //static const empty = User(email: '-', firstName: '-', lastName: '-', userId: '-', userType: UserType.guest);
  //User(this.first_name, this.user_id, this.adminId, this.country, this.last_name, this.email, this.organisation, this.phone, this.type_id, this.password, this.is_approved);
}
