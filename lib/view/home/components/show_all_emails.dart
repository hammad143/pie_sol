import 'package:flutter/material.dart';
import 'package:pie_solution/util/constants.dart';
import 'package:pie_solution/util/strings.dart';

class ShowAllEmails extends StatelessWidget {
  final VoidCallback toDisplayEmail;
  final bool isVisible;
  const ShowAllEmails({Key key, this.toDisplayEmail, this.isVisible = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: GestureDetector(
              onTap: toDisplayEmail,
              child: Column(
                children: [
                  Text(isVisible ? Strings.showEmail : Strings.hideEmail,
                      style: kTextStyle16Purple),
                  Container(
                    color: Colors.purple,
                    width: k50,
                    height: 2,
                  ),
                ],
              ))),
    );
  }
}
