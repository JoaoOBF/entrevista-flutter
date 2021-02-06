import 'dart:async';
import 'package:dio/dio.dart';
import 'package:myapp/core/api/api_response/api_response.dart';
import 'package:myapp/core/client/client.dart';

class RequestApiProvider {
  Client client;
  RequestApiProvider(this.client);

  Future<ApiResponse> post(
    String url,
    dynamic objeto,
  ) async {
    Response response;

    try {
      response = await client.dio.post(url, data: objeto);
      if (response.data != null && (response.statusCode == 200)) {
        return Success();
      }
    } catch (e, stacktrace) {
      print("catch" + e.toString());
      return Failure();
    }

    return null;
  }

  Future<ApiResponse> get(
    String url,
  ) async {
    Response response;

    try {
      response = await client.dio.get(
        url,
      );

      if (response.data != null && response.statusCode == 200) {
        return Success();
      }
    } catch (e, stacktrace) {
      print("catch" + e.toString());
      return Failure();
    }

    return null;
  }
}
