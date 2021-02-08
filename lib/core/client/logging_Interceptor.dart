import 'package:dio/dio.dart';
import 'package:myapp/core/injection/injection.dart';
import 'package:myapp/features/login/data/models/login_model.dart';
import 'package:myapp/features/login/domain/usecases/login_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    if (e.response != null &&
        e.response.data is Map &&
        e.response.data['code'] == 110) {
      login();
    }

    return super.onError(e);
  }

  login() async {
    var result = await injection<LoginUser>()
        .login(LoginModel(userName: 'testFrontEwally', password: '123456'));

    result.fold((failure) {
      print(failure);
    }, (token) async {
      injection<SharedPreferences>().setString("key", token.token);
    });
  }
}
