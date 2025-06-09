/*
{
  "name": "mahesh",
  "email": "mahesh@mailsac.com",
  "password": "password123"
}
 */

class SignUpInputModel {
  String name;
  String email;
  String password;
  SignUpInputModel({
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
    };
  }
}