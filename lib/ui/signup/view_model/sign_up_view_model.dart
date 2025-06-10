import 'package:flutter/material.dart';
import 'package:flutter_tutorial_april/data/model/signUp_input_model.dart';
import 'package:flutter_tutorial_april/data/repositories/login_repository.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpViewModel({required this.loginRepository});
  final LoginRepository loginRepository;

  Future<void> signUp(SignUpInputModel signupMpdel) async {

    final respoonse = await loginRepository.signUp(signupMpdel);
    print(respoonse);

      // Handle successful sign-up

  }
}
