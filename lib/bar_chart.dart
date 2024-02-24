import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarChartWidget extends StatelessWidget {
  final List<charts.Series<ChartData, String>> seriesList;
  final bool animate;

  const BarChartWidget(
      {Key? key, required this.seriesList, required this.animate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: charts.BarChart(
            vertical: true,
            seriesList,
            animate: animate,
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String date;
  final String amount;
  final int measurevalue;

  ChartData(this.date, this.amount, this.measurevalue);
}
