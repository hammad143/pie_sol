import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSliverAppbar extends StatelessWidget {
  final String title;

  const CustomSliverAppbar({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(title),
      backgroundColor: Colors.purple,
      centerTitle: true,
      floating: true,
      pinned: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }
}
