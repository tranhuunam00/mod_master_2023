import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_master_2023/components/styles/border.dart';
import 'package:mod_master_2023/models/accelerometer.model.dart';
import 'package:mod_master_2023/models/user.model.dart';
import 'package:mod_master_2023/repositories/sensor_repository.dart';
import 'package:mod_master_2023/storage/secure_storge.dart';
import 'package:mod_master_2023/ui/ble/helpers/bleHelper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'dart:async';

import 'package:mod_master_2023/services/sensor_service.dart';

class AcceletometerScreen extends StatefulWidget {
  const AcceletometerScreen({Key? key}) : super(key: key);

  @override
  State<AcceletometerScreen> createState() => _AcceletometerScreenState();
}

class _AcceletometerScreenState extends State<AcceletometerScreen> {
  SensorService sensorService = new SensorService();
  SensorRepository sensorRepository = new SensorRepository();
  List<AccelerometerChartModel> listAccX = [
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 7700)),
        value: 0.2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 7400)),
        value: -0.4),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 7200)),
        value: 1.2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 7000)),
        value: 0.7),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 6700)), value: 2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 6700)),
        value: 2.2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 6300)), value: 4),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 6000)),
        value: 1.2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 5800)),
        value: -4.2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 5600)),
        value: -6.5),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 5200)),
        value: -6.2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 5000)), value: -9),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 4500)),
        value: -8.7),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 4200)),
        value: -8.4),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 4000)),
        value: -9.5),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 3900)),
        value: -7.6),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 3600)),
        value: -6.3),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 3300)),
        value: -8.5),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 3000)),
        value: -8.5),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 2600)), value: -8),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 2300)),
        value: -0.2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 1900)),
        value: 2.5),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 1400)),
        value: 5.2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 1200)),
        value: 5.4),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 900)), value: 8),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 600)), value: 8.2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(microseconds: 300)), value: 9),
    AccelerometerChartModel(time: DateTime.now(), value: 9.2)
  ];
  List<AccelerometerChartModel> listAccY = [
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 7700)),
        value: 9.8),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 7400)),
        value: 9.1),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 7200)),
        value: 9.7),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 7000)),
        value: 9.8),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 6700)),
        value: 10.2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 6700)), value: 6),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 6300)),
        value: 3.1),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 6000)),
        value: 3.2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 5800)), value: 3),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 5600)),
        value: 2.4),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 5200)), value: 3),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 5000)), value: 2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 4500)),
        value: 1.2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 4200)),
        value: 1.3),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 4000)), value: 1),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 3900)),
        value: 1.7),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 3600)), value: 7),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 3300)), value: 6),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 3000)), value: 7),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 2600)),
        value: 8.5),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 2300)), value: 8),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 1900)), value: 9),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 1400)), value: 9),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 1200)), value: 8),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 900)), value: 7),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 600)), value: 6),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(microseconds: 300)), value: 5),
    AccelerometerChartModel(time: DateTime.now(), value: 4)
  ];
  // List<AccelerometerChartModel>.empty(growable: true);
  List<AccelerometerChartModel> listAccZ = [
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 7700)),
        value: 3.8),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 7400)),
        value: 3.8),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 7200)),
        value: 1.2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 7000)), value: -9),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 6700)),
        value: -8.5),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 6700)),
        value: -8.2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 6300)), value: -9),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 6000)),
        value: -9.8),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 5800)),
        value: -4.2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 5600)), value: -2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 5200)), value: 4),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 5000)),
        value: 4.8),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 4500)),
        value: 3.8),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 4200)), value: -5),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 4000)),
        value: -2.5),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 3900)), value: -2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 3600)), value: 1),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 3300)), value: 0),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 3000)),
        value: 0.5),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 2600)),
        value: 0.5),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 2300)),
        value: 1.2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 1900)),
        value: 1.5),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 1400)),
        value: -0.2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 1200)),
        value: -0.4),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 900)), value: 1),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(milliseconds: 600)), value: 1.2),
    AccelerometerChartModel(
        time: DateTime.now().subtract(Duration(microseconds: 300)), value: 1.4),
    AccelerometerChartModel(time: DateTime.now(), value: 0.2)
  ];
  late ChartSeriesController _chartSeriesControllerX;
  late ChartSeriesController _chartSeriesControllerY;
  late ChartSeriesController _chartSeriesControllerZ;
  List<PositionCountModal> positions = [
    PositionCountModal(value: 2003, name: "Supine", code: 1),
    PositionCountModal(value: 1056, name: "Left", code: 2),
    PositionCountModal(value: 234, name: "Right", code: 3),
    PositionCountModal(value: 134, name: "Supine", code: 4),
    PositionCountModal(value: 324, name: "Others", code: 5),
    PositionCountModal(value: 789, name: "Not sleep", code: 6),
  ];
  late Timer _timer;
  int countPosition = 0;
  List<int> addPosition = [0, 0, 0, 0, 0, 0];
  bool isCallApi = false;
  String typePosition = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer = new Timer.periodic(Duration(milliseconds: 100), (Timer timer) {
      // setState(() {});
    });
    _timer.cancel();
  }

  double parseData(int pre, int first, int se) {
    String res = "";
    if (pre == 0) {
      res = "-";
    }
    res += first.toString();
    if (se < 10) {
      res = res + "0" + se.toString();
    } else {
      res += se.toString();
    }
    return double.parse(res);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
              decoration: borderStyle,
              margin: new EdgeInsets.symmetric(horizontal: 10.0),
              height: 350.h,
              width: 350.w,
              child: SfCartesianChart(
                  title: ChartTitle(text: 'x,y,z value chart'),
                  onZooming: ((zoomingArgs) => {print(zoomingArgs)}),
                  legend: Legend(
                      isVisible: true,
                      alignment: ChartAlignment.center,
                      position: LegendPosition.bottom),

                  // Initialize category axis
                  primaryXAxis: DateTimeAxis(
                      autoScrollingMode: AutoScrollingMode.end,
                      visibleMinimum: listAccX.length > 120
                          ? listAccX[listAccX.length - 120].time
                          : null,
                      // edgeLabelPlacement: EdgeLabelPlacement.shift,
                      majorGridLines: const MajorGridLines(width: 0),
                      name: "Thời gian",
                      isVisible: true,
                      title: AxisTitle(
                          text: "time (s)", alignment: ChartAlignment.far)),
                  series: <LineSeries<AccelerometerChartModel, DateTime>>[
                    LineSeries<AccelerometerChartModel, DateTime>(
                        onRendererCreated: (ChartSeriesController controller) {
                          _chartSeriesControllerX = controller;
                        },
                        // Bind data source
                        dataSource: listAccX,
                        color: Colors.black,
                        name: "X",
                        yValueMapper: (AccelerometerChartModel accValue, _) =>
                            accValue.value,
                        width: 3,
                        xValueMapper: (AccelerometerChartModel accValue, _) =>
                            (accValue.time)),
                    LineSeries<AccelerometerChartModel, DateTime>(
                        onRendererCreated: (ChartSeriesController controller) {
                          _chartSeriesControllerY = controller;
                        },
                        color: Colors.black,
                        name: "Y",
                        // Bind data source
                        dataSource: listAccY,
                        yValueMapper: (AccelerometerChartModel accValue, _) =>
                            accValue.value,
                        dashArray: <double>[1, 20],
                        width: 3,
                        xValueMapper: (AccelerometerChartModel accValue, _) =>
                            (accValue.time)),
                    LineSeries<AccelerometerChartModel, DateTime>(
                        onRendererCreated: (ChartSeriesController controller) {
                          _chartSeriesControllerZ = controller;
                        },
                        color: Colors.black,

                        // Bind data source
                        dataSource: listAccZ,
                        name: "Z",
                        yValueMapper: (AccelerometerChartModel accValue, _) =>
                            accValue.value,
                        dashArray: <double>[10, 35],
                        width: 3,
                        xValueMapper: (AccelerometerChartModel accValue, _) =>
                            (accValue.time))
                  ])),
          SizedBox(
            height: 30.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: borderStyle,
                height: 160.h,
                width: 350.w,
                child: SfCartesianChart(
                    title: ChartTitle(
                        text: 'Position vs time',
                        textStyle: TextStyle(fontSize: 15.sp)),
                    primaryXAxis: CategoryAxis(),
                    series: <ChartSeries<PositionCountModal, String>>[
                      // Renders column chart
                      ColumnSeries<PositionCountModal, String>(
                          dataSource: positions,
                          xValueMapper: (PositionCountModal data, _) =>
                              data.name,
                          yValueMapper: (PositionCountModal data, _) =>
                              (data.value).round())
                    ]),
              ),
              // Container(
              //   decoration: borderStyle,
              //   height: 150.h,
              //   width: 150.h,
              // )
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            "NOW : LEFT",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(typePosition,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
