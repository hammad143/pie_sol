import 'package:email_launcher/email_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:pie_solution/util/constants.dart';
import 'package:pie_solution/util/strings.dart';
import 'package:pie_solution/viewmodel/category_provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailView extends StatelessWidget {
  final int index;

  const DetailView({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(CupertinoIcons.delete),
        onPressed: () => _deleteItemFromCache(context, index),
      ),
      body: Consumer(builder: (context, watch, child) {
        final category = watch(categoryProvider).category[index];
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.purple,
              title: Text(Strings.detailView),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((_, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: InkWell(
                        onTap: () => _composeEmail(category.emailAddress,
                            category.requestContent, context),
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.envelope,
                              color: kPrimaryColor,
                              size: 28,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              Strings.email,
                              style: TextStyle(color: Colors.black38),
                            ),
                            const SizedBox(width: 10),
                            Text("${category.emailAddress}"),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      onTap: () => _dialNumber(category.phoneNumber, context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.phone,
                              color: Colors.purple,
                              size: 28,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              Strings.phoneNo,
                              style: TextStyle(color: Colors.black38),
                            ),
                            const SizedBox(width: 10),
                            Text("${category.phoneNumber}"),
                          ],
                        ),
                      ),
                    ),
                    Divider(),
                    const SizedBox(height: 10),
                    Text("${category.requestContent}",
                        style: TextStyle(fontSize: 15, color: Colors.black87)),
                  ],
                ),
              );
            }, childCount: 1)),
          ],
        );
      }),
    );
  }

  _deleteItemFromCache(BuildContext context, int index) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: Strings.areYouSure,
      desc: Strings.itemWillBeRemove,
      buttons: [
        DialogButton(
          color: kPrimaryColor,
          child: Text(
            Strings.delete,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: _removeItem(context),
          width: 120,
        )
      ],
    ).show();
  }

  _removeItem(BuildContext context) {
    context.read(categoryProvider).deleteItem(index);
  }

  _composeEmail(String email, String desc, BuildContext context) async {
    final emails = Email(body: desc, to: [email]);
    try {
      await EmailLauncher.launch(emails);
    } catch (e) {
      showToast("Seems like , You don't have an Email app",
          context: context,
          position: StyledToastPosition.bottom,
          animation: StyledToastAnimation.slideFromBottomFade);
    }
  }

  _dialNumber(String num, BuildContext context) async {
    if (await canLaunch("tel://$num")) {
      await launch("tel://$num");
    } else
      showToast("Seems like , You don't have an Email app",
          context: context,
          position: StyledToastPosition.bottom,
          animation: StyledToastAnimation.slideFromBottomFade);
  }
}
