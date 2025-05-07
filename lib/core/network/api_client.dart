import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_buzz/core/constants/api_constant.dart';

import '../../data/model/main_data_model.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<MainDataModel?> fetchData() async {
    try {
      // Make the GET request
      final response = await _dio.get(api);

      // Parse the response data using your model
      final MainDataModel data = MainDataModel.fromJson(response.data);
      return data;
    } catch (e) {
      if (e is DioException) {
        log('Network error: ${e.message}');
        log('DioException: ${e.message}');
        log('DioException type: ${e.type}');
        if (e.response != null) {
          log('Error Response: ${e.response?.data}');
          log('Error Status: ${e.response?.statusCode}');
        }
      } else {
        log('Error fetching data: ${e.toString()}');
        log('Error fetching data: $e');
      }
    }
    return null;
  }
}
