import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myapp/core/injection/injection.dart';
import 'package:myapp/core/styles/app_colors.dart';
import 'package:myapp/core/styles/app_icons.dart';
import 'package:myapp/core/utils/utils.dart';
import 'package:myapp/features/account_management/data/models/statement_model.dart';
import 'package:myapp/features/account_management/domain/entities/statement.dart';
import 'package:myapp/features/account_management/presentation/store/home_controller.dart';
import 'package:myapp/features/account_management/presentation/widgets/chart_balance.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _controller;

  @override
  void initState() {
    _controller = injection<HomeController>();
    _controller.getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //  _controller.getData();
    return Scaffold(
      backgroundColor: AppColors.verde,
      body: _body(),
    );
  }

  _body() {
    var height = MediaQuery.of(context).size.height;
    return Observer(builder: (_) {
      if (_controller.load) {
        return Container(
          height: height,
          color: Colors.white,
          width: double.infinity,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.verde),
            ),
          ),
        );
      }
      return Column(
        children: [
          Container(
            height: height * 0.28,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Text(
                  "Saldo",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                )),
                Observer(builder: (_) {
                  return Center(
                      child: Text(
                    _controller.balance?.formartMoney() ?? "",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 36),
                  ));
                })
              ],
            ),
          ),
          Expanded(
            child: Container(
                height: height,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.gelo,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(15.0),
                    topRight: const Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Extrato:",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 18)),
                        Flexible(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Observer(builder: (_) {
                                return GestureDetector(
                                  onTap: _selectDateNow,
                                  child: Text(
                                    "De: ${Utils.dateToString(_controller.selectedDateNow, pattern: 'yyyy/MM/dd')}",
                                  ),
                                );
                              }),
                            ),
                            decoration: filterDecoration(),
                          ),
                        ),
                        Flexible(
                          child: GestureDetector(
                              onTap: _selectDateLast,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Observer(builder: (_) {
                                    return Text(
                                      "Até: ${Utils.dateToString(_controller.selectedDateLast, pattern: 'yyyy/MM/dd')}",
                                    );
                                  }),
                                ),
                                decoration: filterDecoration(),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: _child(),
                      ),
                    )
                  ],
                )),
          )
        ],
      );
    });
  }

  _child() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 12.0, right: 30.0, top: 30, bottom: 20),
      child: Observer(builder: (_) {
        if (_controller.loadFilter) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.verde),
            ),
          );
        }

        if (_controller.statements == null ||
            !_controller.statements.isValid()) {
          return Center(
            child: Text("Nenhum extrato registrado"),
          );
        }

        return Column(
          children: [
            ChartBalance(_controller.statements),
            Column(
              children: _controller.statements.statements
                  .map<Widget>((e) => _item(e))
                  .toList(),
            ),
          ],
        );
      }),
    );
  }

  BoxDecoration filterDecoration() {
    return BoxDecoration(
      border: Border.all(color: AppColors.hint),
      borderRadius: BorderRadius.all(
          Radius.circular(5.0) //         <--- border radius here
          ),
    );
  }

  Future<void> _selectDateNow() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _controller.selectedDateNow,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _controller.selectedDateNow) {
      _controller.selectedDateNow = picked;
      _controller.filter();
    }
  }

  Future<void> _selectDateLast() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _controller.selectedDateLast,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _controller.selectedDateLast) {
      _controller.selectedDateLast = picked;
      _controller.filter();
    }
  }

  Future _showBottomSheet(String txt) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
              child: SingleChildScrollView(
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.only(left: 5.0, top: 10),
                  child: Text(
                    txt,
                    textAlign: TextAlign.center,
                  )),
            ),
          ));
        });
  }

  _item(Statement model) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.grey,
      ),
      child: ExpansionTile(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.080,
              width: 5,
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
                color: model.isNegative() ? Colors.red : Colors.green,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text("${model.dateFormat()}"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("${model.formartMoney()}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18)),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${model.operationTypeFormat()}",
                          style: TextStyle(
                              color: AppColors.verde,
                              fontWeight: FontWeight.w700,
                              fontSize: 14)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              model.otherInfo.showCupom()
                  ? GestureDetector(
                      onTap: () =>
                          _showBottomSheet(model.otherInfo.formartCupom()),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.verde),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  5.0) //         <--- border radius here
                              ),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.library_books_sharp,
                                  color: AppColors.verde,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('COMPROVANTE',
                                    style: TextStyle(
                                        color: AppColors.verde,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14)),
                              ],
                            )),
                      ),
                    )
                  : Container(),
              SizedBox(
                width: 15,
              ),
              model.otherInfo.showLocation()
                  ? GestureDetector(
                      onTap: () => _controller.openLocation(model.otherInfo),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.verde,
                          borderRadius: BorderRadius.all(Radius.circular(
                                  5.0) //         <--- border radius here
                              ),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('LOCALIZAÇÃO',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14)),
                              ],
                            )),
                      ),
                    )
                  : Container(),
            ],
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
