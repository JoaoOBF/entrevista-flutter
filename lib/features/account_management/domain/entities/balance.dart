import 'package:intl/intl.dart';

class Balance {
  final balance;

  Balance({this.balance});

  String formartMoney() {
    if (balance == null) {
      return '---';
    }

    var simbolInBRFormat =
        new NumberFormat.currency(locale: "pt_BR", symbol: "R\$");
    return simbolInBRFormat.format(balance / 100);
  }
}
