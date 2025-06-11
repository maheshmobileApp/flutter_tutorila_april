import 'package:flutter_tutorial_april/data/model/api_response_model.dart';
import 'package:flutter_tutorial_april/data/model/signUp_input_model.dart';
import 'package:flutter_tutorial_april/data/repositories/login_repository.dart';
import 'package:flutter_tutorial_april/data/services/api_services.dart';
import 'package:flutter_tutorial_april/utils/constants/api_url/api_constants.dart';

class LoginRepositoryImpl extends LoginRepository {
  final ApiServices apiServices = ApiServices();
  @override
  Future<void> login(String email, String password) {

    throw UnimplementedError();
  }
  
  @override
  Future<ApiResponseModel> signUp(SignUpInputModel signUpInputModel) async {
    const url = ApiConstants.baseUrl + ApiConstants.signUp;
  return  await apiServices.postRequest(url, data: signUpInputModel.toJson());
  }
  }