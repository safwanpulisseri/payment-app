import 'package:flutter/material.dart';
import '../../../config/routes/routes_name.dart';
import '../../../core/const/height_width.dart';
import '../../../core/theme/color.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, homePage, (route) => false,);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Center(
        child: Container(
          height: screenHeight(context: context) / 2,
          width: screenWidth(context: context) / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              appLogo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
