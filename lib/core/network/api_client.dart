import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_buzz/core/constants/api_constant.dart';

import '../../data/model/main_data_model.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
              // You can set baseUrl here if needed
            ),
          );

  Future<MainDataModel?> fetchData() async {
    try {
      final response = await _dio.get(api);

      if (response.statusCode == 200 && response.data != null) {
        return MainDataModel.fromJson(response.data);
      } else {
        log('Unexpected response status: ${response.statusCode}');
        return null;
      }
    } on DioException catch (e) {
      log('[Dio Error] Type: ${e.type}');
      log('[Dio Error] Message: ${e.message}');
      if (e.response != null) {
        log('[Dio Error] Status Code: ${e.response?.statusCode}');
        log('[Dio Error] Data: ${e.response?.data}');
      }
    } catch (e, stackTrace) {
      log('[Unexpected Error] $e');
      log('[Stack Trace] $stackTrace');
    }
    return null;
  }
}
