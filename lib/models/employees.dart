class Employee {
  final String? employeeId;
  final String? userId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? organisation;
  final String? submittedBy;
  final String? phone;
  final String? reasonOfSubmission;
  final String? submissionTitle;
  final String? submissionDescription;
  final String? rating;
  final String? identity_type;
  final String? identity_number;

  Employee({
    this.firstName,
    this.userId,
    this.lastName,
    this.identity_type,
    this.identity_number,
    this.submittedBy,
    this.reasonOfSubmission,
    this.submissionTitle,
    this.submissionDescription,
    this.employeeId,
    this.email,
    this.organisation,
    this.phone,
    this.rating,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      employeeId: json['emp_id'],
      userId: json['user_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      organisation: json['organisation'],
      submittedBy: json['submitted_by'],
      reasonOfSubmission: json['reason_of_submission'],
      phone: json['phone'],
      submissionTitle: json['submission_title'],
      submissionDescription: json['submission_description'],
      identity_type: json['identity_type'],
       identity_number: json['identity_number'],
    );
  }
}
