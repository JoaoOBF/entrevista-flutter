import 'package:dartz/dartz.dart';
import 'package:myapp/core/api/api_response/api_response.dart';
import 'package:myapp/features/account_management/data/datasources/account_managemen_datasource.dart';
import 'package:myapp/features/account_management/domain/entities/balance.dart';
import 'package:myapp/features/account_management/domain/entities/statement.dart';
import 'package:myapp/features/account_management/domain/entities/statements.dart';
import 'package:myapp/features/account_management/domain/repositories/account_management_repository.dart';



class AccountManagementImpl implements AccountManagementRepository {
  final AccountManagementDataSource datasource;
  AccountManagementImpl(this.datasource);


  @override
  Future<Either<Failure, Balance>> getUserBalance() async{
    try {
      final result = await datasource.getUserBalance();
      return Right(result);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Statements>> getUserStatements(String initialDate, String finalDate) async{
   try {
      final result = await datasource.getUserStatements(initialDate, finalDate);
      return Right(result);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
