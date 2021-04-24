import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pie_solution/model/category_model.dart';
import 'package:pie_solution/util/constants.dart';
import 'package:pie_solution/view/home/components/expandable_widget.dart';
import 'package:pie_solution/view/home/components/title_widget.dart';
import 'package:pie_solution/view/routes/routes.dart';
import 'package:pie_solution/viewmodel/category_provider.dart';

class ListItemWidget extends StatelessWidget {
  final Category category;
  final int index;
  final bool toHide;
  const ListItemWidget({Key key, this.category, this.index, this.toHide})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18),
      decoration: kListItemDecoration,
      margin: kDefaultHrtAndVrtInset,
      child: Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: kInsetHrtVrt10And8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => _nextDetail(index),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: kInsetBottom4,
                          child: TitleWidget(
                              title: category.name,
                              fontWeight: FontWeight.w500)),
                      ExpandedSection(
                          child: TitleWidget(
                              title: category.emailAddress, lettSpacing: 1),
                          expand: toHide),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                  child: Padding(
                    padding: kInsetAll5,
                    child: Icon(CupertinoIcons.delete, color: kWhite),
                  ),
                  onTap: () => _deleteItemFromCache(index, context))
            ],
          ),
        ),
      ),
    );
  }

  _nextDetail(int index) {
    Get.toNamed(Routes.detail, arguments: index);
  }

  _deleteItemFromCache(int index, BuildContext context) {
    final catProvider = context.read(categoryProvider);
    catProvider.deleteItem(index);
  }
}
