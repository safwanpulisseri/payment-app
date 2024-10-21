import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../../core/const/height_width.dart';
import '../../../core/theme/color.dart';
import '../../../core/util/navigator_key.dart';
import '../../../view_model/mobx/user_mobx.dart';
import '../common_widget/text_common_widget.dart';

Widget visitorListWidget() {
  final userMobx = Provider.of<UserMobx>(navigatorKey!.currentContext!);
  return Observer(builder: (_) {
    if (userMobx.visitors.isEmpty) {
      return const Center(
        child: TextWidgetCommon(
          text: "No Visitors",textColor: kGrey,
        ),
      );
    }
    final visitors = userMobx.visitors.reversed.toList();
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemBuilder: (context, index) {
        return
         Container(
          decoration: BoxDecoration(
            color: kRedLight,
            borderRadius: BorderRadius.circular(10),
          ),child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          tileColor: kGrey.withOpacity(0.3),
          title: TextWidgetCommon(
            text: visitors[index].name!,
            fontWeight: FontWeight.bold,
            textColor: kBlack,
            fontSize: 16,
          ),
          trailing: TextWidgetCommon(
            text: '\u20B9${visitors[index].amount.toString()}',
            fontWeight: FontWeight.w400,
            textColor: kBlack,
            fontSize: 15,
          ),
        ));
      },
      separatorBuilder: (context, index) => kHeight10,
      itemCount: visitors.length,
    );
  });
}
