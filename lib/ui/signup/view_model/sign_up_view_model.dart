import 'package:flutter/material.dart';
import 'package:flutter_tutorial_april/data/model/api_response_model.dart';
import 'package:flutter_tutorial_april/data/model/signUp_input_model.dart';
import 'package:flutter_tutorial_april/data/repositories/login_repository.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpViewModel({required this.loginRepository});
  final LoginRepository loginRepository;

  Future<ApiResponseModel> signUp(SignUpInputModel signupMpdel) async {
    return await loginRepository.signUp(signupMpdel);
      // Handle successful sign-up

  }
}
