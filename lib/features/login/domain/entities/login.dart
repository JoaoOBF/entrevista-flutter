class Login {

  final String userName;
  final String password;
 
  Login({this.password, this.userName});

  bool get isValid => userName != null && userName.isNotEmpty && password != null && password.isNotEmpty;
}