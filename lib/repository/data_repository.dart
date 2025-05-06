import 'dart:developer';

import 'package:dio/dio.dart';

import '../model/main_data_model.dart';

class DataRepository {
  final Dio _dio = Dio();

  Future<MainDataModel?> fetchData() async {
    try {
      // Make the GET request
      final response = await _dio.get(
        'http://13.234.208.111/common/public/home-sections',
      );

      // Debug the response structure

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
