import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/const/height_width.dart';
import '../../../core/util/message_show_helper.dart';
import '../../../core/util/navigator_key.dart';
import '../../../view_model/mobx/user_mobx.dart';
import 'home_body_widgets.dart';
import 'home_small_widget.dart';
import 'visitor_list_widget.dart';

Widget homeBody({
  required TextEditingController amountController,
}) {
  final userMobx = Provider.of<UserMobx>(navigatorKey!.currentContext!);
  bool isSnackbarShown = false;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      userProfileCard(),
      kHeight15,
      Observer(builder: (_) {
        return userAmountEditWidget(
          controller: amountController,
          amount: userMobx.paymentAmount,
          onChanged: (value) {
            if (value.isNotEmpty) {
              int amount = int.parse(amountController.text);
              if (amount <= 0 || amount > 2500) {
                if (!isSnackbarShown) {
                  isSnackbarShown = true;
                  MessageShowHelper.showSnackbar(
                    context: navigatorKey!.currentContext!,
                    snackBarContent: "Amount must be in range 1-2500",
                  );
                }
              }
              userMobx.updatePaymentAmount(value);
            } else {
              userMobx.updatePaymentAmount('0');
              isSnackbarShown = false;
            }
          },
        );
      }),
      kHeight10,
      Observer(
        builder: (_) {
          return paymentMethodToggle(
            isCash: userMobx.paymentMethod == 'cash',
            onToggle: (isCash) {
              userMobx.paymentMethod = isCash ? 'cash' : 'UPI';
              userMobx.isDataEdited = true;
            },
          );
        },
      ),
      kHeight25,
      visitorsTitle(),
      Expanded(
        child: visitorListWidget(),
      ),
    ],
  );
}
