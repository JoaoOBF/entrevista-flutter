import 'package:dartz/dartz.dart';
import 'package:myapp/core/api/api_response/api_response.dart';
import 'package:myapp/features/login/data/models/login_model.dart';
import 'package:myapp/features/login/domain/entities/token.dart';
import 'package:myapp/features/login/domain/repositories/login_repository.dart';

abstract class LoginUser {
  Future<Either<Failure, Token>> login(LoginModel loginModel);
}

class LoginUserImpl implements LoginUser {
  final LoginRepository repository;

  LoginUserImpl(this.repository);

  @override
  Future<Either<Failure, Token>> login(LoginModel loginModel) async {
    // TODO: implement login
    throw UnimplementedError();
  }
}
