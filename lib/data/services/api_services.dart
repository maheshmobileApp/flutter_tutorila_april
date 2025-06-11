import 'package:dio/dio.dart';
import 'package:flutter_tutorial_april/data/model/api_response_model.dart';

class ApiServices {
  final dio = Dio();

  Future<ApiResponseModel> postRequest(String url, {dynamic data}) async {
    try {
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
