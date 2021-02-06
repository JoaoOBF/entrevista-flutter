import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/core/api/api_response/api_response.dart';
import 'package:myapp/features/login/data/models/login_model.dart';
import 'package:myapp/features/login/domain/entities/token.dart';
import 'package:myapp/features/login/domain/repositories/login_repository.dart';
import 'package:myapp/features/login/domain/usecases/login_user.dart';

main() {
  final repository = LoginUserImplMock();
  final usecase = LoginUserImpl(repository);

  final token = Token(token: 'token');
  final erro = Failure(message: 'usuario invalido');

  test('Deve logar o usuario', () async {
    LoginModel loginModel =
        LoginModel(userName: 'testFrontEwally', password: '123456');
    when(repository.login(loginModel)).thenAnswer((_) async => Right(token));

    final result = await usecase.login(loginModel);
    expect(result, Right(token));
  });

  test('Deve retornar msg de erro', () async {
    LoginModel loginModel =
        LoginModel(userName: 'test', password: '126');
    when(repository.login(any)).thenAnswer((_) async => Left(erro));

    final result = await usecase.login(loginModel);
    expect(result, Left(erro));
  });
}

class LoginUserImplMock extends Mock implements LoginRepository {}
