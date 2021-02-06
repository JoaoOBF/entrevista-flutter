import 'package:meta/meta.dart';
import 'package:myapp/features/login/domain/entities/token.dart';

class TokenModel extends Token {
  TokenModel({
    @required String token,
  }) : super(token: token);

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      token: json['token'],
    );
  }

}