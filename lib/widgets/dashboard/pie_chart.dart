import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:sdui_charts/models/pie_chart_model.dart';

class DynamicPieChart extends StatefulWidget {
  late List<PieChartModel> chartData = [];

  DynamicPieChart({Key? key, required this.chartData}) : super(key: key);

  @override
  State<DynamicPieChart> createState() => Dynamic_PieChartState();
}

class Dynamic_PieChartState extends State<DynamicPieChart> {
  Color _hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }

  List<charts.Series<PieChartModel, String>> _seriesPieData = [];

  _generateData() {
    List<charts.Series<PieChartModel, String>> data = [];
    data.add(
      charts.Series(
        domainFn: (PieChartModel chartdata, _) => chartdata.x,
        measureFn: (PieChartModel chartdata, _) => chartdata.y,
        colorFn: (PieChartModel chartdata, _) =>
            charts.ColorUtil.fromDartColor(_hexToColor(chartdata.color)),
        id: 'chartdata data',
        data: widget.chartData,
        labelAccessorFn: (PieChartModel row, _) => '${row.y}',
      ),
    );
    setState(() {
      _seriesPieData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          const Text(
            'SPO2 data',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: charts.PieChart(_seriesPieData,
                animate: true,
                animationDuration: const Duration(seconds: 2),
                behaviors: [
                  charts.DatumLegend(
                    outsideJustification:
                        charts.OutsideJustification.middleDrawArea,
                    horizontalFirst: true,
                    desiredMaxRows: 1,
                    cellPadding: const EdgeInsets.only(right: 4.0, bottom: 4.0),
                    entryTextStyle: charts.TextStyleSpec(
                        color: charts.MaterialPalette.purple.shadeDefault,
                        fontFamily: 'Georgia',
                        fontSize: 11),
                  )
                ],
                defaultRenderer: charts.ArcRendererConfig(
                    arcWidth: 50,
                    arcRendererDecorators: [
                      charts.ArcLabelDecorator(
                          labelPosition: charts.ArcLabelPosition.inside)
                    ])),
          )
        ],
      ),
    );
  }
}
