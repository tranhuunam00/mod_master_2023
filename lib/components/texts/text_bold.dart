import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextBold extends StatelessWidget {
  final String title;
  double? size;
  Color? colors;
  TextAlign? textAlign;
  final int? maxLine;
  TextOverflow? textOverflow;
  FontWeight? fontWeight;

  TextBold(
      {Key? key,
      required this.title,
      this.size,
      this.colors,
      this.textAlign,
      this.maxLine,
      this.textOverflow,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      softWrap: false,
      maxLines: maxLine ?? 1,
      style: TextStyle(
        color: colors ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontFamily: 'Montserrat',
        height: 1.3.h,
        fontSize: size ?? 17.sp,
      ),
    );
  }
}
