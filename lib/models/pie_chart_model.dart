class PieChartModel {
  final String x;
  final int y;
  final String color;

  PieChartModel({required this.x, required this.y, required this.color});

  PieChartModel.initialState()
      : x = "",
        y = 0,
        color = "";

  factory PieChartModel.fromJson(Map<String, dynamic> json) {
    return PieChartModel(
        x: json["x"] ?? "", y: json["y"] ?? "", color: json["color"] ?? "");
  }
}
