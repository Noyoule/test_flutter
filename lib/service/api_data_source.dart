import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/user.dart';

class ApiDataSource {
  final dio = Dio();

  Future<List<User>> getData() async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        'https://randomuser.me/api/',
        options: Options(responseType: ResponseType.json),
      );
      final Map<String, dynamic> responseData = response.data!;
      final List<dynamic> results = responseData['results'];
      final List<User> users =
          results.map((json) => User.fromJson(json)).toList();
      return users;
    } catch (error) {
      print('Error fetching data: $error');
      rethrow;
    }
  }
}
