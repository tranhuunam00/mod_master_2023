import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mod_master_2023/configs/colors.dart';
import 'package:mod_master_2023/ui/home_screen.dart';

class DashboardCustomerScreen extends StatefulWidget {
  const DashboardCustomerScreen({Key? key}) : super(key: key);

  @override
  _DashboardCustomerScreenState createState() =>
      _DashboardCustomerScreenState();
}

class _DashboardCustomerScreenState extends State<DashboardCustomerScreen> {
  int currentIndex = 0;
  late List<Widget> pages;
  @override
  void initState() {
    super.initState();
    pages = [HomeScreen(), Container(), Container()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r))),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.kPrimaryColor,
          selectedItemColor: AppColors.jPrimaryColor,
          unselectedItemColor: AppColors.primaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30.sp,
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
                color: currentIndex == 0 ? AppColors.jPrimaryColor : null,
              ),
            ),
            // const BottomNavigationBarItem(
            //   label: 'Courses',
            //   icon: Icon(Icons.bookmark),
            // ),
            BottomNavigationBarItem(
              label: 'Tutors',
              icon: Icon(
                Icons.group_rounded,
                color: currentIndex == 1 ? AppColors.jPrimaryColor : null,
              ),
            ),
            // BottomNavigationBarItem(
            //   label: 'Promotion',
            //   icon: SvgPicture.asset(
            //     AppImages.icPromotion,
            //     color: currentIndex == 1 ? AppColors.jPrimaryColor : null,
            //   ),
            // ),
            BottomNavigationBarItem(
              label: 'Student',
              icon: Icon(
                Icons.settings,
                color: currentIndex == 2 ? AppColors.jPrimaryColor : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
