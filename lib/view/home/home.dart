import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:pie_solution/api/status.dart';
import 'package:pie_solution/util/durations.dart';
import 'package:pie_solution/util/strings.dart';
import 'package:pie_solution/viewmodel/category_provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(Strings.appBarTitle),
            backgroundColor: const Color(0xffe03319),
            centerTitle: true,
            expandedHeight: resHeight * 15,
            floating: true,
            flexibleSpace: Text(Strings.appBarTitle),
            pinned: true,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((_, index) {
              return Consumer(builder: (context, watch, child) {
                final category = watch(categoryProvider);
                if (FetchStatus.loading == category.status)
                  return Center(
                    child: SpinKitCubeGrid(
                        duration: Durations.SEC_500, color: Colors.red),
                  );
                else if (FetchStatus.error == category.status)
                  return Center(
                    child: RoundedLoadingButton(
                      controller: _btnController,
                      child: Text("Retry"),
                      onPressed: _fetchItems,
                      color: Colors.red,
                      valueColor: Colors.white,
                    ),
                  );
                return AnimationLimiter(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: category.category.length,
                    itemBuilder: (_, index) {
                      return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: Durations.SEC_500,
                          child: SlideAnimation(
                            child: Slidable(
                              child: ListTile(
                                title: Text("${category.category[index].name}"),
                              ),
                            ),
                          ));
                    },
                    shrinkWrap: true,
                  ),
                );
              });
            }, childCount: 1),
          ),
        ],
      ),
    );
  }
}
