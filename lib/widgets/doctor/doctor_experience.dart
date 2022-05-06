import 'package:flutter/material.dart';
import 'package:sdui_charts/models/experience_model.dart';
import '../../constants/colors.dart';
import '../../constants/radii.dart';
import '../../constants/borders.dart';
import '../../constants/styles.dart';
import '../../constants/strings.dart';
import "../../models/doctor_model.dart";

class DoctorExperience extends StatelessWidget {
  final DoctorExperienceModel experience;

  const DoctorExperience({Key? key, required this.experience})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
            margin: Margins.doctorCardMargin,
            decoration: BoxDecoration(
              borderRadius: Radii.k12pxRadius,
              color: AppColors.homeScreenBackgroundWhite,
              border: Border.fromBorderSide(Borders.doctorCardBorder),
            ),
            child: Column(
              children: [
                Text(experience.domain),
              ],
            )));
  }
}
