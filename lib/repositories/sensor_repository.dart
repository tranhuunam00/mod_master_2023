import 'package:mod_master_2023/models/accelerometer.model.dart';
import 'package:mod_master_2023/services/sensor_service.dart';

class SensorRepository {
  final SensorService sensorService = new SensorService();

  Future<dynamic> createAccelerometer(CreateAccelerometerModel acc) async {
    return await sensorService.createAccelerometer(acc);
  }
}
