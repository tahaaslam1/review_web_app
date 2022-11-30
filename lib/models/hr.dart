class HR {
  final String? first_name;
  final String? user_id;
  final String? adminId;
  final String? country;
  final String? last_name;
  final String? email;
  final String? organisation;
  final String? phone;
  final String? type_id;
  final String? password;
  final bool? is_approved;

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
