import 'package:flutter_tutorial_april/data/model/api_response_model.dart';
import 'package:flutter_tutorial_april/data/model/signIn_input_model.dart';
import 'package:flutter_tutorial_april/data/model/signUp_input_model.dart';

abstract class LoginRepository {
Future<ApiResponseModel> login(SignInInputModel signInInputModel);
  Future<ApiResponseModel> signUp(SignUpInputModel signUpInputModel);
}