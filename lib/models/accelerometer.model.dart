class AccelerometerModel {
  final double x;
  final double y;
  final double z;
  final DateTime time;
  AccelerometerModel(
      {required this.x, required this.y, required this.z, required this.time});
}

class AccelerometerChartModel {
  final double value;
  final DateTime time;
  AccelerometerChartModel({required this.value, required this.time});
}

class PositionCountModal {
  int value;
  final String name;
  final int code;
  PositionCountModal(
      {required this.value, required this.name, required this.code});
}

class CreateAccelerometerModel {
  final String value;
  final String customer;
  CreateAccelerometerModel({required this.value, required this.customer});
  Map<String, dynamic> toJson() =>
      {'value': value, 'customer': customer, "nameSensor": "accelerometer"};
}
