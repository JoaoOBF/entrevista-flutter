import 'package:dio/dio.dart';
import 'package:myapp/core/client/auth_interceptor.dart';
import 'package:myapp/core/utils/constants.dart';
import 'logging_Interceptor.dart';

class Client {
  Dio dio;

  Client() {
    init();
  }

  init() {
    dio = Dio();
    dio.options.baseUrl = apiBase;
    dio.interceptors.add(LoggingInterceptor());
    dio.interceptors.add(AuthIntercetors());
    dio.options.connectTimeout = 30000;
    dio.options.receiveTimeout = 30000;
  }
}
