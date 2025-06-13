
class SignInInputModel {
  String email;
  String password;
  SignInInputModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}