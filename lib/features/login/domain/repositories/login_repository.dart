import 'package:dartz/dartz.dart';
import 'package:myapp/core/api/api_response/api_response.dart';
import 'package:myapp/features/login/data/models/login_model.dart';
import 'package:myapp/features/login/domain/entities/token.dart';

abstract class LoginRepository {
  Future<Either<Failure, Token>> login(LoginModel loginModel);
}
