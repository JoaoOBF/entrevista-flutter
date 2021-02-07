import 'package:dartz/dartz.dart';
import 'package:myapp/core/api/api_response/api_response.dart';
import 'package:myapp/features/account_management/domain/entities/balance.dart';
import 'package:myapp/features/account_management/domain/entities/statement.dart';


abstract class AccountManagementRepository {
  Future<Either<Failure, Balance>> getUserBalance();
  Future<Either<Failure, List<Statement>>> getUserStatements();
}
