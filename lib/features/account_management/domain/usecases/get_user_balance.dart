import 'package:dartz/dartz.dart';
import 'package:myapp/core/api/api_response/api_response.dart';
import 'package:myapp/features/account_management/domain/entities/balance.dart';
import 'package:myapp/features/account_management/domain/repositories/account_management_repository.dart';


abstract class GetUserBalance {
  Future<Either<Failure, Balance>> getUserBalance();
}

class GetUserBalanceImpl implements GetUserBalance {
  final AccountManagementRepository repository;

  GetUserBalanceImpl(this.repository);

  @override
  Future<Either<Failure, Balance>> getUserBalance() async {
    // TODO: implement getUserBalance
    return await repository.getUserBalance();
  }
}
