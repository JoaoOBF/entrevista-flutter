import 'package:meta/meta.dart';
import 'package:myapp/features/account_management/data/models/other_info_model.dart';
import 'package:myapp/features/account_management/domain/entities/statement.dart';

class StatementModel extends Statement {
  StatementModel({
    @required String id,
    @required amount,
    @required balance,
    @required String createdAt,
    @required String operationType,
    @required OtherInfoModel otherInfo,
  }) : super(
            id: id,
            amount: amount,
            balance: balance,
            createdAt: createdAt,
            operationType: operationType,
            otherInfo: otherInfo);

  factory StatementModel.fromJson(Map<String, dynamic> json) {
    return StatementModel(
      id: json['username'],
      amount: json['amount'],
      balance: json['balance'],
      createdAt: json['createdAt'],
      operationType: json['operationType'],
      otherInfo: json['otherInfo'] != null
          ? OtherInfoModel.fromJson(json['otherInfo'])
          : null,
    );
  }
}
