import 'package:flutter/material.dart';
import 'package:intercorp_app/utils/constants.dart';
import 'package:intercorp_app/utils/widget_functions.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;

  const BottomButton(
      {super.key, required this.text, required this.icon, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      child: FlatButton(
        splashColor: COLOR_DARK_BLUE.withAlpha(55),
        color: COLOR_DARK_BLUE,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        onPressed: () {},
        child: Row(children: [
          Icon(
            icon,
            color: COLOR_WHITE,
          ),
          addHorizontalSpace(10),
          Text(
            this.text,
            style: TextStyle(color: COLOR_WHITE),
          )
        ]),
      ),
    );
  }
}
