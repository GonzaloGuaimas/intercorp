import 'package:flutter/material.dart';
import 'package:intercorp_app/utils/constants.dart';

class BorderBox extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double width, height;

  const BorderBox(
      {super.key,
      required this.padding,
      required this.width,
      required this.height,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      decoration: BoxDecoration(
          color: COLOR_WHITE,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: COLOR_GREY.withAlpha(30), width: 3)),
      padding: padding ?? const EdgeInsets.all(10.0),
      child: Center(child: this.child),
    );
  }
}
