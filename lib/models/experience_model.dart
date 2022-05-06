// import 'S/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class DoctorExperienceModel {
  final num years;
  final String domain;

  DoctorExperienceModel({required this.years, required this.domain});

  DoctorExperienceModel.initialState()
      : years = 0,
        domain = "";

  factory DoctorExperienceModel.fromJson(Map<String, dynamic> json) {
    return DoctorExperienceModel(
        years: json["years"] ?? "", domain: json["domain"] ?? "");
  }
}
