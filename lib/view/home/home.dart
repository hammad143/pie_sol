import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:pie_solution/api/status.dart';
import 'package:pie_solution/util/constants.dart';
import 'package:pie_solution/util/durations.dart';
import 'package:pie_solution/util/strings.dart';
import 'package:pie_solution/view/base_widget/custom_sliver_appbar.dart';
import 'package:pie_solution/view/base_widget/loader.dart';
import 'package:pie_solution/view/base_widget/loader_with_btn.dart';
import 'package:pie_solution/view/base_widget/small_bar.dart';
import 'package:pie_solution/view/home/components/list_item_widget.dart';
import 'package:pie_solution/viewmodel/category_provider.dart';

import 'components/show_all_emails.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isHide = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => _fetchItems());
  }

  _fetchItems() => context.read(categoryProvider).fetchCategories();
  @override
  Widget build(BuildContext context) {
    final resHeight = Get.height / 100;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _dragRefresh,
        child: CustomScrollView(
          slivers: [
            CustomSliverAppbar(title: Strings.appBarTitle),
            SliverList(
              delegate: SliverChildBuilderDelegate((_, index) {
                return Container(
                  color: Colors.purple,
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: kTopLeftRightRadius50,
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Column(
                        children: [
                          SmallBarWidget(),
                          Consumer(builder: (context, watch, child) {
                            final category = watch(categoryProvider);
                            //If Category items are loading
                            if (FetchStatus.loading == category.status)
                              return Loader();
                            //If an error occurs while fetching items
                            else if (FetchStatus.error == category.status)
                              return LoaderWithButton();
                            //When items are successfully fetched
                            return Column(
                              children: [
                                ShowAllEmails(
                                  toDisplayEmail: _showEmails,
                                  isVisible: !_isHide,
                                ),
                                AnimationLimiter(
                                  child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemCount: category.category.length,
                                    itemBuilder: (_, index) {
                                      final _category =
                                          category.category[index];
                                      return AnimationConfiguration
                                          .staggeredList(
                                              position: index,
                                              delay: Durations.SEC_500,
                                              duration: Durations.SEC_500,
                                              child: SlideAnimation(
                                                  child: ListItemWidget(
                                                      category: _category,
                                                      index: index,
                                                      toHide: _isHide)));
                                    },
                                    shrinkWrap: true,
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      );
                    }),
                  ),
                );
              }, childCount: 1),
            ),
          ],
        ),
      ),
    );
  }

  _showEmails() {
    setState(() {
      _isHide = !_isHide;
    });
  }

  Future<void> _dragRefresh() async {
    context.read(categoryProvider).fetchCategories();
  }
}
