import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../model/user_model.dart';

class ApiDataSource {
  final _dio = Dio();

  Future<List<UserModel>> getData(int limit) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
          'https://randomuser.me/api/',
          queryParameters: {'results': limit});
      final Map<String, dynamic> responseData = response.data!;
      final List<dynamic> results = responseData['results'];
      final List<UserModel> users =
          results.map((json) => UserModel.fromJson(json)).toList();
      return users;
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching data: $error');
      }
      rethrow;
    }
  }

}
