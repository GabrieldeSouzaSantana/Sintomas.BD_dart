import 'package:dio/dio.dart';

import '../sintomas.dart';

class SintomaApi {
  final dio = Dio();
  String baseUrl = 'https://my-json-server.typicode.com/GabrieldeSouzaSantana/fake-api';

  Future<Sintoma?> findAll() async {
    final response = await dio.get('$baseUrl/db');

    if (response.statusCode == 200) {
      return Sintoma.fromJson(response.data);
    }
    return null;
  }
}