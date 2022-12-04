class HR {
  late String? first_name;
  late final String? user_id;
  final String? adminId;
  late String? country;
  late String? last_name;
  final String? email;
  late String? organisation;
  late String? phone;
  final int? type_id;
  final String? password;
  late bool? is_approved;

  HR({
    this.first_name,
    this.last_name,
    this.adminId,
    this.email,
    this.organisation,
    this.phone,
    this.user_id,
    this.type_id,
    this.country,
    this.password,
    this.is_approved,
  });

  factory HR.fromJson(Map<String, dynamic> json) {
    return HR(
        first_name: json['first_name'],
        last_name: json['last_name'],
        user_id: json['user_id'],
        email: json['email'],
        password: json['password'],
        organisation: json['organisation'],
        phone: json['phone'],
        adminId: json['admin_id'],
        type_id: json['type_id'],
        country: json['country'],
        is_approved: json['is_approved']);
  }
}
