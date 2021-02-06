import 'package:dartz/dartz.dart';
import 'package:myapp/core/api/api_response/api_response.dart';
import 'package:myapp/features/login/data/datasources/login_datasource.dart';
import 'package:myapp/features/login/data/models/login_model.dart';
import 'package:myapp/features/login/domain/entities/token.dart';
import 'package:myapp/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource datasource;
  LoginRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, Token>> login(LoginModel loginModel) async {
    try {
      final result = await datasource.login(loginModel);
      return Right(result);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
