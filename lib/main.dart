import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:practise_application/bar_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey),
        useMaterial3: false,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> data = [
      ChartData('2 Month', '13533円', 1),
      ChartData('3 Month', '13733円', 2),
      ChartData('4 Month', '53733円', 3),
      ChartData('5 Month', '23333円', 4),
      ChartData('6 Month', '23333円', 2),
    ];

    List<charts.Series<ChartData, String>> createSeries() {
      return [
        charts.Series<ChartData, String>(
          id: 'Sales',
          data: data,
          domainFn: (ChartData sales, _) => sales.date,
          measureFn: (ChartData sales, _) => sales.measurevalue,
        )
      ];
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Bar chart"),
      ),
      body: Column(
        children: [
          // Barchart
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BarChartWidget(
              seriesList: createSeries(),
              animate: true,
            ),
          ),
        ],
      ),
    );
  }
}
