import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_master_2023/components/cards/cart_sensor.dart';
import 'package:mod_master_2023/configs/colors.dart';
import 'package:mod_master_2023/configs/constants.dart';
import 'package:mod_master_2023/configs/images.dart';
import 'package:mod_master_2023/models/bleModel.dart';
import 'package:mod_master_2023/provider/bluetooth.provider.dart';
import 'package:mod_master_2023/ui/ble/DiscoveryScreen.dart';
import 'package:mod_master_2023/ui/ble/sensor/Sensor.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart'
    hide BluetoothDevice;
import 'package:flutter_blue/flutter_blue.dart' hide BluetoothState;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  BluetoothDevice? selectedDevice = null;

  @override
  void initState() {
    super.initState();

    // change state bluetooth
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    // check đã bật bluetoooth chưa và set name và address
    Future.doWhile(() async {
      if ((await FlutterBluetoothSerial.instance.isEnabled) ?? false) {
        return false;
      }
      await Future.delayed(Duration(milliseconds: 0xDD));
      await FlutterBluetoothSerial.instance.requestEnable();
      return true;
    });

    // Listen for futher state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;
      });
    });
  }

  @override
  void dispose() {
    FlutterBluetoothSerial.instance.setPairingRequestHandler(null);
    FlutterBlue.instance.stopScan();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bluetoothProvider =
        Provider.of<BluetoothProvider>(context, listen: false);

    selectedDevice = bluetoothProvider.BleP.bluetoothDevice;
    return Scaffold(
      body: Container(
        // nút bajaty blue tooth
        child: ListView(
          children: <Widget>[
            Container(
              height: 200.h,
              decoration: BoxDecoration(
                  color: AppColors.jPrimaryColor,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(40.r))),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                width: 50,
                height: 50,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: TextButton(
                    onPressed: () async {
                      final BluetoothDevice? device =
                          await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return FindDevicesScreen();
                          },
                        ),
                      );

                      if (device != null) {
                        BluetoothModel ble =
                            BluetoothModel(bluetoothDevice: device);
                        await bluetoothProvider.setBle(ble);
                        setState(() {
                          selectedDevice = device;
                        });
                        // _startChat(context, device!);
                      } else {
                        print('Discovery -> no device selected');
                      }
                    },
                    child: Text("chọn bluetooth")),
              ),
            ),
            selectedDevice != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CartSensor(
                        onPress: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return SensorDashboard(
                                  device: selectedDevice!,
                                  numberDataSend: 600,
                                );
                              },
                            ),
                          );
                        },
                        img: AppImages.accelerometer_Img,
                        lable: Constants.ACCLEROMETER,
                      ),
                      CartSensor(
                        onPress: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return SensorDashboard(
                                  device: selectedDevice!,
                                  numberDataSend: 60,
                                );
                              },
                            ),
                          );
                        },
                        img: AppImages.nhiet_do_Img,
                        lable: Constants.TEMPERATURE,
                      ),
                      CartSensor(
                        onPress: () {},
                        img: AppImages.am_thanh_Img,
                        lable: Constants.SOUND,
                      ),
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
