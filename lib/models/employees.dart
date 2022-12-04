class Employee {
  final String? firstName;
  final String? userId;
  final String? identity_type;
  final String? identity_number;
  final String? employeeId;
  final String? rating;
  final String? lastName;
  final String? email;
  final String? passport;
  final String? nationalId;
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
    this.identity_type,
    this.identity_number,
    this.submittedBy,
    this.reasonForSubmission,
    this.submissionTitle,
    this.submissionDescription,
    this.employeeId,
    this.email,
    this.organisation,
    
    this.phone,
    this.rating,
    this.password,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      firstName: json['first_name'],
      lastName: json['last_name'],
      userId: json['user_id'],
      email: json['email'],
      password: json['password'],
      identity_type: json['identity_type'],
      identity_number: json['identity_number'],
      organisation: json['organisation'],
      submittedBy: json['submitted_by'],
      phone: json['phone'],
      employeeId: json['emp_id'],
      reasonForSubmission: json['reason_of_submission'],
      submissionTitle: json['submission_title'],
      submissionDescription: json['submission_description'],
    );
  }
}
