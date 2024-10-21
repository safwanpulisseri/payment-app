import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/color.dart';
import '../../../core/util/navigator_key.dart';
import '../../../model/models/visitor_model.dart';
import '../../../view_model/mobx/user_mobx.dart';
import '../common_widget/text_field_common_widget.dart';
import '../common_widget/text_common_widget.dart';

Widget visitorsAddButton({
  required UserMobx userMobx,
}) {
  return FloatingActionButton.extended(
    backgroundColor: kWhite,
    onPressed: () {
      final Visitor visitor = Visitor(
          amount: 1000, name: 'Visitor ${userMobx.visitors.length + 1}');
      userMobx.addVisitor(visitor: visitor);
    },
    label: const TextWidgetCommon(
      text: "Add Visitor",
      fontWeight: FontWeight.bold,
      textColor: kBlack,
      fontSize: 16,
    ),
  );
}

Widget userAmountShowWidget({required String amount}) {
  return TextWidgetCommon(
    text: "\u20B9$amount",
    fontWeight: FontWeight.w500,
    textColor: kBlack,
    fontSize: 18,
  );
}

Widget userAmountEditWidget({
  required String amount,
  required Function(String) onChanged,
  required TextEditingController controller,
}) {
  return SizedBox(
    width: MediaQuery.of(navigatorKey!.currentContext!).size.width / 2,
    child: TextFieldCommon(
      prefix: const TextWidgetCommon(
        text: '\u20B9',
      ),
      style: GoogleFonts.alegreyaSansSc(),
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      controller: controller,
      textAlign: TextAlign.start,
      border: const OutlineInputBorder(),
      hintText: "Enter amount",
      labelText: "Edit amount",
    ),
  );
}

Widget paymentMethodToggle({
  required bool isCash,
  required Function(bool) onToggle,
}) {
  return Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const TextWidgetCommon(text: 'Payment Method', fontSize: 16,),
      Row(
        children: [
          const TextWidgetCommon(text: 'CASH'),
          Switch(
            value: !isCash,
            onChanged: (value) {
              onToggle(!value);
            },
          ),
          const TextWidgetCommon(text: 'UPI'),
        ],
      ),
    ],
  );
}

Widget userNameShowWidget({required String userName}) {
  return TextWidgetCommon(
    text: userName,
    fontWeight: FontWeight.bold,
    textColor: kBlack,
    fontSize: 20,
  );
}

Widget homeAppBar({
  required UserMobx userMobx,
  required TextEditingController controller,
}) {
  return AppBar(
    title: const TextWidgetCommon(text: "Payee Manager"),
    actions: [
      TextButton(
        onPressed: () {
          userMobx.clearData();
          controller.text = '2500';
        },
        child: const Icon(
          Icons.clear_all,
          color: kBlack,
        ),
      ),
    ],
    backgroundColor: kWhite,
  );
}