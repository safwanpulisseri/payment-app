import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/const/height_width.dart';
import '../../../core/theme/color.dart';
import '../../../view_model/mobx/user_mobx.dart';
import '../../widget/home/home_body.dart';
import '../../widget/home/home_small_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController amountController = TextEditingController(text: '2500');
  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userMobx = Provider.of<UserMobx>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: homeAppBar(userMobx: userMobx, controller: amountController),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: kWhite,
          width: screenWidth(context: context),
          height: screenHeight(context: context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: homeBody(amountController: amountController),
          ),
        ),
      ),
    );
  }
}