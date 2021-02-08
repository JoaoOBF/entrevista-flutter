import 'package:meta/meta.dart';
import 'package:myapp/core/api/api_response/api_response.dart';
import 'package:myapp/core/api/provider/request_api_provider.dart';
import 'package:myapp/features/account_management/data/models/balance_model.dart';
import 'package:myapp/features/account_management/data/models/statement_model.dart';
import 'package:myapp/features/account_management/domain/entities/balance.dart';
import 'package:myapp/features/account_management/domain/entities/statement.dart';

abstract class AccountManagementDataSource {
  Future<Balance> getUserBalance();
  Future<List<Statement>> getUserStatements(
      String initialDate, String finalDate);
}

class AccountManagementDataSourceImpl implements AccountManagementDataSource {
  final RequestApiProvider client;

  AccountManagementDataSourceImpl({@required this.client});

  @override
  Future<Balance> getUserBalance() async {
    final url = '/account/balance';
    ApiResponse response = await client.get(url);

    if (response is Success) {
      return BalanceModel.fromJson(response.data);
    } else {
      throw Exception('credenciais erradas');
    }
  }

  @override
  Future<List<Statement>> getUserStatements(
      String initialDate, String finalDate) async {
    final url = '/b2b/statement';
    ApiResponse response = await client.get(url, querryParam: {
      'initialDate': initialDate,
      'finalDate': finalDate,
    });

    if (response is Success) {
      return (response.data['statement'] as List)
          .map((i) => StatementModel.fromJson(i))
          .toList();
    } else {
      throw Exception('credenciais erradas');
    }
  }
}
