import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:mod_master_2023/configs/constants.dart';
import 'package:mod_master_2023/models/accelerometer.model.dart';

class SensorService {
  static const String sensorRoute = 'sensor';
  Future<dynamic> createAccelerometer(CreateAccelerometerModel acc) async {
    var header = await Constants.requestHeadersToken();
    final response = await http.post(
      Uri.parse("${Constants.baseUrl}${sensorRoute}"),
      headers: header,
      body: jsonEncode(
        acc.toJson(),
      ),
    );
    debugPrint(response.body);
    return response;
  }
}
