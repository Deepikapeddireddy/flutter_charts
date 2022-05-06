import 'package:sdui_charts/models/doctor_model.dart';
import 'package:sdui_charts/widgets/dynamic/en_dynamic_parser.dart';
import 'package:flutter/material.dart';

class DoctorProfile extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorProfile({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EnDynamicJson optionsFromServer = EnDynamicJson.fromJson({
      "type": "column",
      "model": [
        {
          "years": 3,
          "domain": "Cardio",
        },
        {
          "years": 4,
          "domain": "Derma",
        },
      ],
      "widget": {"name": "DoctorExperience", "properties": {}}
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dcotor profile"),
      ),
      body: Column(
        children: [
          Text(doctor.fullName),
          for (var v in optionsFromServer.model)
            enDynamicWidgetApplier[optionsFromServer.widget.name]!(
              v,
              optionsFromServer.widget.properties,
            )
        ],
      ),
    );
  }
}
