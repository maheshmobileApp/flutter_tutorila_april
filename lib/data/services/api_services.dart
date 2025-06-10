import 'package:dio/dio.dart';

class ApiServices {
  final dio = Dio();

  Future<dynamic> postRequest(String url, {dynamic data}) async {
    try {

      final response = await dio.post(url, data: data);
      return response.data;
    } catch (e) {
      throw Exception('Failed to post data: $e');
    }
  }

//GET
//POST
//PUT
//Delete
}
