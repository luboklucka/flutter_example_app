import 'dart:convert';

import 'package:app_example_flutter/src/features/universities/model/university.dart';
import 'package:app_example_flutter/src/networking/api_base.dart';
import 'package:http/http.dart' as http;

class ApiService extends ApiBaseHelper {
  static const _baseUrl = 'universities.hipolabs.com';

  ApiService({httpClient}) : super(httpClient);

  Future<http.Response> getUniversities() async {
    final response = await httpClient
        .get(Uri.http(_baseUrl, '/search', {'country': 'United States'}));

    return response;
  }

  Future<List<University>> fetchUniversities() async {
    try {
      final response = await get(
          Uri.http(_baseUrl, '/search', {'country': 'United States'}));

      final List t = json.decode(response.body);
      final List<University> universities =
          t.map((item) => University.fromJson(item)).toList();

      return universities;
    } catch (e) {
      rethrow;
    }
  }
}
