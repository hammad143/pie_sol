import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_solution/util/constants.dart';
import 'package:pie_solution/util/durations.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCubeGrid(duration: Durations.SEC_500, color: kPrimaryColor),
    );
  }
}
