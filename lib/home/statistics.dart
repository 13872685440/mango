import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../widgets/app_bar.dart';

class Statistics extends StatefulWidget {
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: MyAppBar(title: "统计"),
        body: Container(
          margin: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200.0,
                child: charts.BarChart(
                  //通过下面获取数据传入
                  ChartFlutterBean.createSampleData(),
                  //配置项，以及设置触发的函数
                  selectionModels: [
                    charts.SelectionModelConfig(
                        type: charts.SelectionModelType.info)
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

//一下为组合柱状图数据部分
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

class ChartFlutterBean {
  static List<charts.Series<OrdinalSales, String>> createSampleData() {
    final data = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}
