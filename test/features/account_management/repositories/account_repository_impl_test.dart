import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/core/api/api_response/api_response.dart';
import 'package:myapp/features/account_management/data/datasources/account_managemen_datasource.dart';
import 'package:myapp/features/account_management/data/repositories/account_management_repository_impl.dart';
import 'package:myapp/features/account_management/domain/entities/balance.dart';
import 'package:myapp/features/account_management/domain/entities/statement.dart';
import 'package:myapp/features/account_management/domain/entities/statements.dart';
import 'package:myapp/features/login/data/models/login_model.dart';
import 'package:myapp/features/login/data/repositories/login_repository_impl.dart';
import 'package:myapp/features/login/domain/entities/token.dart';

class AccountManagementDataSourceMock extends Mock
    implements AccountManagementDataSource {}

main() {
  final datasource = AccountManagementDataSourceMock();
  final repository = AccountManagementImpl(datasource);

  final balance = Balance(balance: 1000);
  final erro = Failure(message: 'usuario invalido');

  test('deve retornar o balanço', () async {
    when(datasource.getUserBalance()).thenAnswer((_) async => balance);

    var result = await repository.getUserBalance();
    expect(result | null, isA<Balance>());
  });

  test('deve retornar um Erro do balanço', () async {
    when(datasource.getUserBalance()).thenThrow(Exception());

    var result = await repository.getUserBalance();
    expect(result.fold(id, id), isA<Failure>());
  });

   test('deve retornar as transações', () async {
    when(datasource.getUserStatements('','')).thenAnswer((_) async => Statements());

    var result = await repository.getUserStatements('','');
    expect(result | null, isA<Statements>());
  });

  test('deve retornar um Erro das transações', () async {
    when(datasource.getUserStatements('','')).thenThrow(Exception());

    var result = await repository.getUserStatements('','');
    expect(result.fold(id, id), isA<Failure>());
  });
}
