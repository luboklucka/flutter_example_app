import 'dart:io';

import 'package:flutter_example_app/src/networking/network_exceptions.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class ApiBaseHelper {
  final http.Client httpClient;
  ApiBaseHelper(this.httpClient);

  Future<dynamic> get(Uri url) async {
    final http.Response responseJson;
    try {
      final response = await httpClient.get(url);
      developer.log(response.toString());

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
