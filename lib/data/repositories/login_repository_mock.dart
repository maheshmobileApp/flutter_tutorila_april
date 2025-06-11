import 'package:flutter_tutorial_april/data/model/api_response_model.dart';
import 'package:flutter_tutorial_april/data/model/signUp_input_model.dart';
import 'package:flutter_tutorial_april/data/repositories/login_repository.dart';

class LoginRepositoryMock extends LoginRepository {
  @override
  Future<void> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
  
  @override
  Future<ApiResponseModel> signUp(SignUpInputModel signUpInputModel) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
  }