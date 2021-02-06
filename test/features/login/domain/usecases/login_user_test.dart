import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/features/login/domain/repositories/login_repository.dart';
import 'package:myapp/features/login/domain/usecases/login_user.dart';
main() {

  final repository = LoginUserImplMock();
  final usecase =  LoginUserImpl(repository);

  test('Deve logar o usuario', () async{
    final result = null; //= await usecase.login('userName', 'password');
    expect(result, Map<String, dynamic>());
  });
}

class LoginUserImplMock extends Mock implements LoginRepository {} 