import 'package:meta/meta.dart';
import 'package:myapp/features/login/domain/entities/login.dart';

class LoginModel extends Login {
  LoginModel({
    @required String userName,
    @required String password,
  }) : super(userName: userName, password: password);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      userName: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': userName,
      'password': password,
    };
  }
}