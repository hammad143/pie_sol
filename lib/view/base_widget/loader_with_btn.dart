import 'package:flutter/material.dart';
import 'package:pie_solution/util/constants.dart';
import 'package:pie_solution/util/strings.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoaderWithButton extends StatelessWidget {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  LoaderWithButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RoundedLoadingButton(
        controller: _btnController,
        child: Text(Strings.retry),
        //onPressed: _fetchItems,
        color: kPrimaryColor,
        valueColor: Colors.white,
      ),
    );
  }
}
