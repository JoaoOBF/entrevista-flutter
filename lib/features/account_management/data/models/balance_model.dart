import 'package:meta/meta.dart';
import 'package:myapp/features/account_management/domain/entities/balance.dart';

class BalanceModel extends Balance {
  BalanceModel({
    @required  balance,
  }) : super(balance: balance);

  factory BalanceModel.fromJson(Map<String, dynamic> json) {
    return BalanceModel(
      balance: json['balance'],
    );
  }

}