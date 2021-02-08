import 'package:myapp/features/account_management/domain/entities/other_info.dart';
import 'package:intl/intl.dart';

class Statement {
  String id;
  var amount;
  var balance;
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

  String operationTypeFormat() {
    Map<String, String> _map = {
      'RECEIVED_TRANSFERENCE': 'TRANSFERÊNCIA RECEBIDA',
      'SENT_TRANSFERENCE': 'TRANSFERÊNCIA ENVIADA',
      'BANK_SLIP_DEPOSIT': 'DEPÓSITO BOLETO BANCÁRIO',
      'BANK_SLIP_PAYMENT': 'PAGAMENTO BOLETO BANCÁRIO',
      'ECARD_CHARGE': 'CARGA ECARD',
      'ECARD_CHARGE_TAX': 'CARGA ECARD TAXA',
      'EAGENT_DEPOSIT': 'DEPÓSITO DE EAGENT',
      'EAGENT_DEPOSIT_TAX': 'TAXA DEPÓSITO DE EAGENT',
      'EAGENT_DEPOSIT_EARNING': 'GANHO DEPÓSITO DE EAGENT',
      'BANK_DEPOSIT': 'DEPÓSITO BANCÁRIO'
    };
    return _map.containsKey(this.operationType)
        ? _map[this.operationType]
        : this.operationType;
  }

  String dateFormat() {
    final df = new DateFormat('dd/MM/yyyy HH:mm');
    var time = DateTime.tryParse(this.createdAt);
    return time == null ? "" : df.format(time);
  }

  bool isNegative() => this.amount < 0;

  double inReal() => amount / 100;

  String formartMoney() {
    if (amount == null) {
      return '---';
    }

    var simbolInBRFormat =
        new NumberFormat.currency(locale: "pt_BR", symbol: "R\$");
    return simbolInBRFormat.format(inReal());
  }
}
