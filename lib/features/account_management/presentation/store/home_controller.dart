import 'package:mobx/mobx.dart';
import 'package:myapp/core/utils/utils.dart';
import 'package:myapp/features/account_management/domain/entities/balance.dart';
import 'package:myapp/features/account_management/domain/entities/other_info.dart';
import 'package:myapp/features/account_management/domain/entities/statement.dart';
import 'package:myapp/features/account_management/domain/entities/statements.dart';
import 'package:myapp/features/account_management/domain/usecases/get_user_balance.dart';
import 'package:myapp/features/account_management/domain/usecases/get_user_statements.dart';
import 'package:url_launcher/url_launcher.dart';
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
  Statements statements;

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
    statements = null;
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

  openLocation(OtherInfo otherInfo) async {
    final String googleMapslocationUrl =
        "https://www.google.com/maps/search/?api=1&query=${otherInfo.userLatitude},${otherInfo.userLogintude}";

    final String encodedURl = Uri.encodeFull(googleMapslocationUrl);

    if (await canLaunch(encodedURl)) {
      await launch(encodedURl);
    } else {
      print('Could not launch $encodedURl');
      throw 'Could not launch $encodedURl';
    }
  }
}
