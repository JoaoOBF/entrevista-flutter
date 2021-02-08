import 'package:mobx/mobx.dart';
import 'package:myapp/core/utils/utils.dart';
import 'package:myapp/features/account_management/domain/entities/balance.dart';
import 'package:myapp/features/account_management/domain/entities/statement.dart';
import 'package:myapp/features/account_management/domain/usecases/get_user_balance.dart';
import 'package:myapp/features/account_management/domain/usecases/get_user_statements.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  GetUserBalance _getUserBalance;
  GetUserStatements _getUserStatements;

  _HomeControllerBase(this._getUserBalance, this._getUserStatements);

  @observable
  bool load = false;

  @observable
  bool loadFilter = false;

  @observable
  Balance balance;

  @observable
  List<Statement> statements = [];

  @observable
  DateTime selectedDateNow = DateTime.utc(2019, 01, 01);

  @observable
  DateTime selectedDateLast = DateTime.utc(2019, 01, 31);

  @action
  getData() async {
    load = true;
    var balanceResult = await _getUserBalance.getUserBalance();
    var statementsResult = await _getUserStatements.getUserStatements(
        Utils.dateToString(
          selectedDateNow,
        ),
        Utils.dateToString(selectedDateLast));
    load = false;
    balanceResult.fold((failure) {
      print(failure);
    }, (balance) {
      this.balance = balance;
    });

    statementsResult.fold((failure) {
      print(failure);
    }, (statementsResult) {
      this.statements = statementsResult;
    });
  }

  @action
  filter() async {
    loadFilter = true;
    statements = [];
    var statementsResult = await _getUserStatements.getUserStatements(
        Utils.dateToString(
          selectedDateNow,
        ),
        Utils.dateToString(selectedDateLast));
    loadFilter = false;

    statementsResult.fold((failure) {
      print(failure);
    }, (statementsResult) {
      this.statements = statementsResult;
    });
  }
}
