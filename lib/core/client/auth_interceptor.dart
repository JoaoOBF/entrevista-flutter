import 'package:dio/dio.dart';
import 'package:myapp/core/injection/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthIntercetors extends InterceptorsWrapper {
  final _shared = injection<SharedPreferences>();

  @override
  onRequest(RequestOptions options) async {
    return await _headers(options);
  }

  @override
  onResponse(Response response) {
    return super.onResponse(response);
  }

  @override
  onError(DioError error) {
    return super.onError(error);
  }

  Future<RequestOptions> _headers(RequestOptions options) async {
    var token = await _shared.get("token");
    if (token != null && token.length > 0) {
      options.headers["Authorization"] = "Bearer $token";
    }

    return options;
  }
}
