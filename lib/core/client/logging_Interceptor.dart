import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) {
    print("REQUEST[${options?.method}] => PATH: ${options?.path}");
    return super.onRequest(options);
  }

  @override
  onResponse(Response response) {
    //200
    //201
    print(
        "RESPONSE[${response?.statusCode}] => PATH: ${response?.request?.path}");
    return super.onResponse(response);
  }

  @override
  onError(DioError e) {
    //Exception
    print("ERROR[${e?.response?.statusCode}] => PATH: ${e?.request?.path}");

    return super.onError(e);
  }


}
