import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final double fontSize, lettSpacing;
  final FontWeight fontWeight;
  final Color color;
  const TitleWidget({
    Key key,
    this.title,
    this.fontSize = 16,
    this.lettSpacing,
    this.color = Colors.white,
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: lettSpacing),
    );
  }
}
