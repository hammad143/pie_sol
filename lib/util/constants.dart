import 'package:flutter/material.dart';

//Values
const double k50 = 50;
const double k4 = 4;

//Colors
const kPrimaryColor = Colors.purple;
const kGrayColor54 = Colors.black54;
const kGrayColor87 = Colors.black87;
const kWhite = Colors.white;

//Default TextStyle
const kTextStyle16Purple = TextStyle(
  color: kPrimaryColor,
  fontSize: 16,
);

//List Item Decoration With Radius
final kListItemDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(100),
  color: Colors.purple,
);

//Radius
const kTopLeftRightRadius50 = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50), topRight: Radius.circular(50)));

//Default ListItem Margin
final kDefaultHrtAndVrtInset =
    EdgeInsets.symmetric(vertical: 5, horizontal: 10);
final kInsetAll5 = const EdgeInsets.all(5);
final kInsetBottom4 = const EdgeInsets.only(bottom: 4);
final kInsetHrtVrt10And8 =
    const EdgeInsets.symmetric(horizontal: 10, vertical: 8);
