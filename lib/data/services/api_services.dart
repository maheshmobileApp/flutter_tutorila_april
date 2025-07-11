import 'package:dio/dio.dart';
import 'package:flutter_tutorial_april/data/model/api_response_model.dart';
import 'package:flutter_tutorial_april/utils/constants/local_storate_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  final dio = Dio();

  Future<ApiResponseModel> postRequest(String url, {dynamic data}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      dio.options.headers['Authorization'] =
          'Bearer ${prefs.getString(LocalStorageConstants.token)}';
      final response = await dio.post(url, data: data);
      switch (response.statusCode) {
        case 200:
        case 201:
          return ApiResponseModel(
            data: response.data,
            message: 'Request successful',
            status: true,
          );
        default:
          return ApiResponseModel(
            data: null,
            message: 'Request failed with status: ${response.statusCode}',
            status: false,
          );
      }
    } catch (e) {
      return ApiResponseModel(
        data: '',
        message: 'An error occurred: $e',
        status: false,
      );
    }
  }

//GET
//POST
//PUT
//Delete
}
