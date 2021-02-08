import 'package:dartz/dartz.dart';
import 'package:myapp/core/api/api_response/api_response.dart';
import 'package:myapp/features/account_management/domain/entities/statement.dart';
import 'package:myapp/features/account_management/domain/repositories/account_management_repository.dart';

abstract class GetUserStatements {
  Future<Either<Failure, List<Statement>>> getUserStatements(
      String initialDate, String finalDate);
}

class GetUserStatementsImpl implements GetUserStatements {
  final AccountManagementRepository repository;

  GetUserStatementsImpl(this.repository);

  @override
  Future<Either<Failure, List<Statement>>> getUserStatements(
      String initialDate, String finalDate) async {
    // TODO: implement getUserStatements
    return await repository.getUserStatements(initialDate, finalDate);
  }
}
