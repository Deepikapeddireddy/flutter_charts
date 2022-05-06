class DoctorModel {
  final String fullName;
  final String speciality;

  DoctorModel({required this.fullName, required this.speciality});

  DoctorModel.initialState()
      : fullName = "",
        speciality = "";

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
        fullName: json["fullName"] ?? "", speciality: json["speciality"] ?? "");
  }
}
