import 'package:flutter/material.dart';

class SmallBarWidget extends StatelessWidget {
  const SmallBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 60,
      height: 10,
      decoration: BoxDecoration(
        color: Color(0xFFACA9A9),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
