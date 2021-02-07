import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/core/api/api_response/api_response.dart';
import 'package:myapp/features/account_management/domain/entities/balance.dart';
import 'package:myapp/features/account_management/domain/entities/statement.dart';
import 'package:myapp/features/account_management/domain/repositories/account_management_repository.dart';
import 'package:myapp/features/account_management/domain/usecases/get_user_balance.dart';
import 'package:myapp/features/account_management/domain/usecases/get_user_statements.dart';

main() {
  final repository = AccountManagementImplMock();
  final getUseBalance = GetUserBalanceImpl(repository);
  final getUserStatements = GetUserStatementsImpl(repository);

  final balance = Balance(balance: 1000);
  final erro = Failure(message: 'erro generico');

  test('Deve retornar o balanço do usuario', () async {
    when(repository.getUserBalance()).thenAnswer((_) async => Right(balance));

    final result = await getUseBalance.getUserBalance();
    expect(result, Right(balance));
  });

  test('Deve retornar msg de erro no balanço', () async {
    when(repository.getUserBalance()).thenAnswer((_) async => Left(erro));

    final result = await getUseBalance.getUserBalance();
    expect(result, Left(erro));
  });

  test('Deve retornar as transações do usuario', () async {
    when(repository.getUserStatements())
        .thenAnswer((_) async => Right(List<Statement>()));

    final result = await getUserStatements.getUserStatements();
    expect(result | null, isA<List<Statement>>());
  });

  test('Deve retornar msg de erro nas transações', () async {
    when(repository.getUserStatements()).thenAnswer((_) async => Left(erro));

    final result = await getUserStatements.getUserStatements();
    expect(result, Left(erro));
  });
}

class AccountManagementImplMock extends Mock
    implements AccountManagementRepository {}
