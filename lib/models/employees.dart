class Employee {
  final String? firstName;
  final String? userId;
  final String? employeeId;
  final String? rating;
  final String? lastName;
  final String? email;  final String? identity_type;
  final String? identity_number;

  final String? organisation;
  final String? submittedBy;
  final String? phone;
  final String? reasonForSubmission;
  final String? submissionTitle;
  final String? submissionDescription;
  final String? password;

  Employee({
    this.firstName,
    this.userId,
    this.lastName,
    this.nationalId,
    this.submittedBy,
    this.reasonForSubmission,
    this.submissionTitle,
    this.submissionDescription,
    this.employeeId,
    this.email,    this.identity_number,

    this.organisation,
    this.identity_type,
    this.phone,
    this.rating,
    this.password,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        first_name: json['firstname'],
        last_name: json['last_name'],
        user_id: json['user_id'],
        email: json['email'],
        password: json['password'],
        identity_number: json['identity_number'],
        identity_type: json['identity_type'],
        organisation: json['organisation'],
        submitted_by: json['submitted_by'],
        phone: json['phone'],
        employeeId: json['employee_id'],
        reason_for_submission: json['reason_of_submission'],
        submission_title: json['submission_title'],
        submission_description: json['submission_description']);

  }
}
