import 'package:flutter_tutorial_april/data/repositories/login_repository.dart';

class LoginRepositoryMock extends LoginRepository {
  @override
  Future<void> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
  }