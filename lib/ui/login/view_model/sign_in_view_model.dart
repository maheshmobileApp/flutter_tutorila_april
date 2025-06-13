import 'package:flutter/cupertino.dart';
import 'package:flutter_tutorial_april/data/model/api_response_model.dart';
import 'package:flutter_tutorial_april/data/model/signIn_input_model.dart';

import '../../../data/repositories/login_repository.dart';

class SignInViewModel extends ChangeNotifier {
  SignInViewModel({required this.loginRepository});
  final LoginRepository loginRepository;
  Future<ApiResponseModel> login(SignInInputModel signinMpdel) async {
    return await loginRepository.login(signinMpdel);
  }
}
