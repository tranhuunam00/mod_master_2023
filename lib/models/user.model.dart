import 'dart:convert';

class ProfileUser {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  String? avatarUrl;
  final String id;
  final String nationality;
  final String gender;
  final String dob;
  final String customerId;

  ProfileUser(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      this.avatarUrl,
      required this.dob,
      required this.gender,
      required this.nationality,
      required this.customerId});

  factory ProfileUser.fromJson(Map<String, dynamic> json) {
    return ProfileUser(
        id: json['_id'] ?? '',
        customerId: json['customerId'] ?? '',
        firstName: json['firstName'] ?? '',
        lastName: json['lastName'] ?? '',
        email: json['email'] ?? '',
        phone: json['phone'] ?? '',
        avatarUrl: json['avatarUrl'] ??
            'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
        dob: json['dob'] ?? '',
        gender: json['gender'] ?? '',
        nationality: json['nationality'] ?? '');
  }

  Map<String, String> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phone': phone,
        'dob': dob,
        'gender': gender,
        // 'nationality': nationality!,
      };

  String toString() => {
        '"firstName"': '"' + firstName + '"',
        '"customerId"': '"' + customerId + '"',
        '"id"': '"' + id + '"',
        '"lastName"': '"' + lastName + '"',
        '"email"': '"' + email + '"',
        '"phone"': '"' + phone + '"',
        '"dob"': '"' + dob + '"',
        '"gender"': '"' + gender + '"',
        '"nationality"': '"' + nationality + '"',
      }.toString();

  String toStringJson() {
    String res = "";
    res = res + '"firstName"';
    return res;
  }
}
