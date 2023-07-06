import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  final String urlBackground;
  const Background({Key? key, required this.child, required this.urlBackground})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Stack(children: [
      Container(
        width: size.width,
        height: size.height,
        child: Image.asset(
          urlBackground,
          color: Color.fromRGBO(255, 255, 255, 0.3),
          colorBlendMode: BlendMode.hardLight,
          fit: BoxFit.cover,
        ),
      ),
      child
    ]));
  }
}
