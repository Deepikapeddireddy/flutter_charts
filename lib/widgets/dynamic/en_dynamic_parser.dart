import 'package:sdui_charts/models/doctor_model.dart';
import 'package:sdui_charts/models/experience_model.dart';
import 'package:sdui_charts/models/pie_chart_model.dart';
import 'package:sdui_charts/widgets/dashboard/bar_Chart.dart';
import 'package:sdui_charts/widgets/dashboard/pie_chart.dart';
import 'package:sdui_charts/widgets/doctor/doctor_experience.dart';
import 'package:sdui_charts/widgets/dynamic/doctor_card_v1.dart';
import 'package:flutter/material.dart';

class EnDynamicParser extends StatelessWidget {
  final EnDynamicJson options;
  const EnDynamicParser({Key? key, required this.options}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (options.type == "column") {
      return Column(
        key: UniqueKey(),
        children: [
          for (var v in options.model)
            enDynamicWidgetApplier[options.widget.name]!(
              v,
              options.widget.properties,
            )
        ],
      );
    }
    return Row(
      key: UniqueKey(),
      children: [
        for (var v in options.model)
          enDynamicWidgetApplier[options.widget.name]!(
            v,
            options.widget.properties,
          )
      ],
    );
  }
}

class EnDynamicJson {
  String type;
  dynamic model;
  EnDynamicWidgetJson widget;
  EnDynamicJson({
    required this.type,
    required this.model,
    required this.widget,
  });

  factory EnDynamicJson.fromJson(Map<String, dynamic> json) {
    return EnDynamicJson(
      type: json["type"],
      model: json["model"],
      widget: EnDynamicWidgetJson.fromJson(json["widget"]),
    );
  }
}

class EnDynamicWidgetJson {
  String name;
  dynamic properties;
  EnDynamicWidgetJson({
    required this.name,
    required this.properties,
  });

  factory EnDynamicWidgetJson.fromJson(Map<String, dynamic> json) {
    return EnDynamicWidgetJson(
      name: json["name"],
      properties: json["properties"],
    );
  }
}

Map<String, Function> enDynamicWidgetApplier = {
  "DoctorCardV1": (value, properties) {
    DoctorModel doctor = DoctorModel.fromJson(value);
    DoctorCardV1Properties doctorCardProperties =
        DoctorCardV1Properties.fromJson(properties);
    return DoctorCardV1(
      doctor: doctor,
      cardProperties: doctorCardProperties,
    );
  },
  "DoctorExperience": (value, properties) {
    DoctorExperienceModel exp = DoctorExperienceModel.fromJson(value);
    return DoctorExperience(experience: exp);
  },
  "PieChart": (value, properties) {
    List<PieChartModel> chartData = [];
    // here value is in the below format
    /*  
      [
        {"x": 'LOWEST', "y": 35, "color": "fc9468"},
        {"x": 'HIGHEST', "y": 15, "color": "8ffc68"},
        {"x": 'MEDIAN', "y": 30, "color": "6fc8f7"},
        {"x": 'AVERAGE', "y": 20, "color": "816de3"},
      ]
    */
    for (var pieData in value) {
      chartData.add(PieChartModel.fromJson(pieData));
    }
    // var chartData = [
    //   PieChartModel(x: 'LOWEST', y: 35, color: '816de3'),
    //   PieChartModel(x: 'HIGHEST', y: 15, color: '6ee6b8'),
    //   PieChartModel(x: 'MEDIAN', y: 30, color: '816de3'),
    //   PieChartModel(x: 'AVERAGE', y: 20, color: '6ee6b8'),
    // ];
    // print(chartData);

    return DynamicBarChart(chartData: chartData);
  },
  "BarChart": (value, properties) {
    List<PieChartModel> chartData = [];
    for (var barData in value) {
      chartData.add(PieChartModel.fromJson(barData));
    }
    return DynamicBarChart(chartData: chartData);
  }
};
