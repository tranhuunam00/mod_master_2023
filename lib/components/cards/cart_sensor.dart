import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_master_2023/components/texts/text_bold.dart';

class CartSensor extends StatelessWidget {
  const CartSensor(
      {Key? key,
      required this.onPress,
      required this.lable,
      required this.img,
      this.size})
      : super(key: key);
  final Function onPress;
  final String lable;
  final String img;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress();
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(size ?? 50.w)),
            child: Container(
                alignment: Alignment.center,
                color: Color.fromARGB(255, 213, 226, 247),
                width: size ?? 80.w,
                height: size ?? 80.w,
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextBold(
            title: lable,
            size: size == null || size! > 60.w ? 13.sp : 10.sp,
          )
        ],
      ),
    );
  }
}
