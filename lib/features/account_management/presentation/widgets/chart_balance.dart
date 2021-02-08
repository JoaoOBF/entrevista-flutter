import 'package:flutter/material.dart';
import 'package:myapp/core/styles/app_colors.dart';
import 'package:myapp/features/account_management/domain/entities/statement.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:myapp/features/account_management/domain/entities/statements.dart';

class ChartBalance extends StatelessWidget {
  final Statements date;

  const ChartBalance(this.date, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _progressVertically();
  }

  _progressVertically() {
    return Container(
      height: 200,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: charts.BarChart(
        _createSampleData(),
        animate: true,
        barGroupingType: charts.BarGroupingType.grouped,
      ),
    );
  }

  List<charts.Series<OrdinalSales, String>> _createSampleData() {
    List<OrdinalSales> positiveData = [];
    List<OrdinalSales> negativeData = [];

    date.datesStatments().forEach((element) {
      positiveData.add(
          OrdinalSales(element, date.entriesByDay(element, isNegative: false)));
      negativeData.add(
          OrdinalSales(element, date.entriesByDay(element, isNegative: true)));
    });
    final red = charts.MaterialPalette.red.makeShades(2);
    final blue = charts.MaterialPalette.blue.makeShades(2);
    return [
      new charts.Series<OrdinalSales, String>(
        id: 'positive',
        colorFn: (_, x) => blue[1],
        domainFn: (OrdinalSales sales, _) => sales.date.substring(0, 2),
        measureFn: (OrdinalSales sales, _) => sales.amount,
        data: positiveData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'negative',
        colorFn: (_, x) => red[1],
        domainFn: (OrdinalSales sales, _) => sales.date.substring(0, 2),
        measureFn: (OrdinalSales sales, _) => sales.amount,
        data: negativeData,
      ),
    ];
  }
}

class OrdinalSales {
  final String date;
  final double amount;

  OrdinalSales(this.date, this.amount);
}
