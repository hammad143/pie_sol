import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pie_solution/util/durations.dart';
import 'package:pie_solution/util/strings.dart';
import 'package:pie_solution/view/routes/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: GetMaterialApp(
        title: Strings.appTitle,
        onGenerateRoute: Routes.routeGenerate,
        transitionDuration: Durations.SEC_1500,
        defaultTransition: Transition.rightToLeftWithFade,
      ),
    );
  }
}
