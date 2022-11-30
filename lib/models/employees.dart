class Employee {
  final String? first_name;
  final String? user_id;
  final String? employeeId;
  final String? rating;
  final String? last_name;
  final String? email;
  final String? passport;
  final String? national_id;
  final String? organisation;
  final String? submitted_by;
  final String? phone;
  final String? reason_for_submission;
  final String? submission_title;
  final String? submission_description;
  final String? password;

  Employee({
    this.first_name,
    this.last_name,
    this.employeeId,
    this.email,
    this.national_id,
    this.organisation,
    this.passport,
    this.phone,
    this.rating,
    this.reason_for_submission,
    this.submission_description,
    this.submission_title,
    this.submitted_by,
    this.user_id,
    this.password,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        first_name: json['firstname'],
        last_name: json['last_name'],
        user_id: json['user_id'],
        email: json['email'],
        password: json['password'],
        passport: json['passport'],
        national_id: json['national_id'],
        organisation: json['organisation'],
        submitted_by: json['submitted_by'],
        phone: json['phone'],
        employeeId: json['employee_id'],
        reason_for_submission: json['reason_for_submission'],
        submission_title: json['submission_title'],
        submission_description: json['submission_description']);
  }
}
