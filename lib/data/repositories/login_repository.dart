import 'package:flutter_tutorial_april/data/model/api_response_model.dart';
import 'package:flutter_tutorial_april/data/model/signUp_input_model.dart';

abstract class LoginRepository {
  Future<void> login(String email, String password);
  Future<ApiResponseModel> signUp(SignUpInputModel signUpInputModel);
}