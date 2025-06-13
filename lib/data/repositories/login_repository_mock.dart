import 'package:flutter_tutorial_april/data/model/api_response_model.dart';
import 'package:flutter_tutorial_april/data/model/signIn_input_model.dart';
import 'package:flutter_tutorial_april/data/model/signUp_input_model.dart';
import 'package:flutter_tutorial_april/data/repositories/login_repository.dart';

class LoginRepositoryMock extends LoginRepository {
 
  
  @override
  Future<ApiResponseModel> signUp(SignUpInputModel signUpInputModel) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<ApiResponseModel> login(SignInInputModel signInInputModel) {
    // TODO: implement login
    throw UnimplementedError();
  }
  }