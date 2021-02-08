import 'package:myapp/features/account_management/domain/entities/statement.dart';

class Statements {
  List<Statement> statements = [];
  Statements({this.statements});

  bool isValid() => statements != null && statements.length > 0;

  double entriesByDay(String date, {bool isNegative}) {
     
    var total = 0.0;
    if (!isValid()) {
      return total;
    }
    var _list = statements.where((statement) =>
        date == statement.dateFormat().substring(0, 10));
    _list?.forEach((element) {
      if (isNegative == null) {
        total += element.inReal();
      } else if (element.isNegative() && isNegative) {
        total += element.inReal();
      } else if (!element.isNegative() && !isNegative) {
        total += element.inReal();
      }
    });
    return total;
  }

  List<String> datesStatments() {
    List<String> _list = [];
    List<Statement> statementsHelper = List.from(statements);

    do {
      Statement _statement = statementsHelper.first;
      if (_list.contains(_statement.dateFormat().substring(0, 10))) {
        statementsHelper.remove(_statement);
      } else {
        _list.add(_statement.dateFormat().substring(0, 10));
      }
    } while (statementsHelper.length > 0);

    return _list;
  }
}
