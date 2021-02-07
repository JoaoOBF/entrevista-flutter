import 'package:myapp/features/account_management/domain/entities/other_info.dart';

class Statement {
  String id;
  int amount;
  int balance;
  String createdAt;
  String operationType;
  OtherInfo otherInfo;

  Statement(
      {this.id,
      this.amount,
      this.balance,
      this.createdAt,
      this.operationType,
      this.otherInfo});
}
