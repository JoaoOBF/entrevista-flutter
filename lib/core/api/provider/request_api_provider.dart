import 'dart:async';
import 'package:dio/dio.dart';
import 'package:myapp/core/api/api_response/api_response.dart';

class RequestApiProvider {
  Dio client;
  RequestApiProvider(this.client);

  Future<ApiResponse> post(
    String url,
    dynamic objeto,
  ) async {
    Response response;

    try {
      response = await client.post(url, data: objeto);
      if (response.data != null && (response.statusCode == 200)) {
        return Success();
      }
    } catch (e, stacktrace) {
      print("catch" + e.toString());
      return Failure();
    }

    return null;
  }

  Future<ApiResponse> getFrom(
    String url,
  ) async {
    Response response;

    try {
      response = await client.get(
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
