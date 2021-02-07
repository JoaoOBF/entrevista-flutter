import 'package:mobx/mobx.dart';
import 'package:myapp/core/injection/injection.dart';
import 'package:myapp/features/login/data/models/login_model.dart';
import 'package:myapp/features/login/domain/repositories/login_repository.dart';
import 'package:myapp/features/login/domain/usecases/login_user.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  LoginUser loginUser;

  _LoginControllerBase(this.loginUser);

  @observable
  bool load = false;

  @observable
  String username = "";

  @action
  onChangeUsername(String value) => this.username = value;

  @observable
  String password = "";

  @computed
  LoginModel get loginCredential =>
      LoginModel(userName: username, password: password);

  @computed
  bool get isValid => loginCredential.isValid;

  @action
  onChangePassword(String value) => this.password = value;

  @action
  login() async {
    load = true;
    var result = await loginUser.login(loginCredential);
    load = false;
    result.fold((failure) {
      print(failure);
    }, (token) {
      print(token);
    });
  }
}
