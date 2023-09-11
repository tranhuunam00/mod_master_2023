import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_master_2023/app_navigator.dart';
import 'package:mod_master_2023/components/styles/appbar.dart';
import 'package:mod_master_2023/configs/constants.dart';
import 'package:mod_master_2023/ui/ble/sensor/accelerometer.dart';
import 'package:mod_master_2023/ui/dashboard_customer_screen.dart';
import 'package:mod_master_2023/ui/welcome/welcome_chatbot_screen.dart';

class DoAnApp extends StatelessWidget {
  const DoAnApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (BuildContext context, child) => GlobalLoaderOverlay(
                  child: MaterialApp(
                    title: 'Đồ án',
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      primarySwatch: Colors.blue,
                    ),
                    navigatorKey: Appnavigator.navigatorKey,
                    home: Container(
                      child: Scaffold(
                        appBar: appBarStyle("ACCELEROMETER"),
                        body: AcceletometerScreen(),
                      ),
                    ),
                    routes: {
                      Constants.dashBoardCustomer: (context) =>
                          const DashboardCustomerScreen(),
                    },
                  ),
                )));
  }
}
