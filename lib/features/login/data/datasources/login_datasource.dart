import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:myapp/core/api/api_response/api_response.dart';
import 'package:myapp/core/api/provider/request_api_provider.dart';
import 'package:myapp/features/login/data/models/login_model.dart';
import 'package:myapp/features/login/data/models/token_model.dart';
import 'package:myapp/features/login/domain/entities/token.dart';

abstract class LoginDataSource {
  Future<Token> login(LoginModel loginModel);
}

class LoginDataSourceImpl implements LoginDataSource {
  final RequestApiProvider client;

  LoginDataSourceImpl({@required this.client});

  @override
  Future<Token> login(LoginModel loginModel) async {
    final url = '/user/login';
    ApiResponse response = await client.post(url, loginModel.toJson());

    if (response is Success) {
      return TokenModel.fromJson(response.data);
    } else {
      throw Exception('credenciais erradas');
    }
  }
}
