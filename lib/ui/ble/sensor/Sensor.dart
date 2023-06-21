import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'dart:async';

import 'package:mod_master_2023/configs/constants.dart';
import 'package:mod_master_2023/ui/ble/sensor/accelerometer.dart';

class SensorDashboard extends StatelessWidget {
  const SensorDashboard({Key? key, required this.device}) : super(key: key);
  final BluetoothDevice device;
  @override
  Widget build(BuildContext context) {
    bool isService = false;
    BluetoothService? accelerometerService;
    BluetoothCharacteristic? accelerometerCharactis;
    bool isNotify = false;

    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                  bottomLeft: Radius.circular(70))),
          title: Text(device.name),
          actions: <Widget>[
            StreamBuilder<BluetoothDeviceState>(
              stream: device.state,
              initialData: BluetoothDeviceState.connecting,
              builder: (c, snapshot) {
                VoidCallback? onPressed;
                String text;
                switch (snapshot.data) {
                  case BluetoothDeviceState.connected:
                    onPressed = () => device.disconnect();
                    text = 'DISCONNECT';
                    break;
                  case BluetoothDeviceState.disconnected:
                    onPressed = () => device.connect();
                    text = 'CONNECT';
                    break;
                  default:
                    onPressed = null;
                    text = snapshot.data.toString().substring(21).toUpperCase();
                    break;
                }
                return Text("");
              },
            )
          ],
        ),
        body: StreamBuilder<bool>(
            stream: device.isDiscoveringServices,
            initialData: false,
            builder: (c, snapshot) {
              if (!isService) {
                device.discoverServices();
              }

              return StreamBuilder<List<BluetoothService>>(
                  stream: device.services,
                  initialData: [],
                  builder: (c, snapshot) {
                    if (snapshot.data!.length > 0) {
                      isService = true;
                    }
                    BluetoothService serviceAcclerometer;
                    if (snapshot.data == null || snapshot.data!.length == 0) {
                      return Text("Please contact customer Service");
                    }
                    for (int i = 0; i < snapshot.data!.length; i++) {
                      if (snapshot.data![i].uuid.toString() ==
                          Constants.ACCLEROMETER_SERVICE) {
                        accelerometerService = snapshot.data![i];
                      }
                    }
                    if (accelerometerService == null) {
                      return Text("Please contact customer Service 2");
                    }
                    for (int i = 0;
                        i < accelerometerService!.characteristics.length;
                        i++) {
                      print(accelerometerService!.characteristics[i].uuid);
                      if (accelerometerService!.characteristics[i].uuid
                              .toString() ==
                          Constants.ACCLEROMETER_CHARACTION) {
                        accelerometerCharactis =
                            accelerometerService!.characteristics[i];
                      }
                    }

                    if (accelerometerCharactis == null) return Container();
                    // if (!accelerometerCharactis!.isNotifying) {
                    //   accelerometerCharactis!.setNotifyValue(true);
                    // }
                    // isNotify = false;
                    return AcceletometerScreen(
                        accelerometerCharactis: accelerometerCharactis!);
                  });
            }));
  }
}
