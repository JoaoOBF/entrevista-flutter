import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/core/api/api_response/api_response.dart';
import 'package:myapp/features/login/data/datasources/login_datasource.dart';
import 'package:myapp/features/login/data/models/login_model.dart';
import 'package:myapp/features/login/data/repositories/login_repository_impl.dart';
import 'package:myapp/features/login/domain/entities/token.dart';

class LoginDatasourceMock extends Mock implements LoginDataSource {}

main() {
  final datasource = LoginDatasourceMock();
  final repository = LoginRepositoryImpl(datasource);

  final token = Token(token: 'token');
  final erro = Failure(message: 'usuario invalido');

  test('deve retornar um token', () async {
    when(datasource.login(any)).thenAnswer((_) async => token);
    LoginModel loginModel =
        LoginModel(userName: 'testFrontEwally', password: '123456');
    var result = await repository.login(loginModel);
    expect(result | null, isA<Token>());
  });

  test('deve retornar um Erro', () async {
    when(datasource.login(any)).thenThrow(Exception());
 LoginModel loginModel =
        LoginModel(userName: 'teste', password: '123456');
    var result = await repository.login(loginModel);
    expect(result.fold(id, id), isA<Failure>());
  });
}
