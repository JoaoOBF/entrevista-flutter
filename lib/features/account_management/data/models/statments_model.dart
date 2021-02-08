import 'package:meta/meta.dart';
import 'package:myapp/features/account_management/data/models/statement_model.dart';
import 'package:myapp/features/account_management/domain/entities/statements.dart';

class StatementsModel extends Statements {
  StatementsModel({
    @required statements,
  }) : super(statements: statements);

  factory StatementsModel.fromJson(Map<String, dynamic> json) {
    return StatementsModel(
      statements: (json['statement'] as List)
          .map((i) => StatementModel.fromJson(i))
          .toList(),
    );
  }
}
