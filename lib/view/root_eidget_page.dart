import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/routes/routes_name.dart';
import '../core/network/connection_service.dart';
import '../core/util/navigator_key.dart';
import '../view_model/mobx/user_mobx.dart';
import 'page/home/home_page.dart';
import 'page/onboarding/onbaording_page.dart';

class RootWidgetPage extends StatefulWidget {
  const RootWidgetPage({super.key});

  @override
  State<RootWidgetPage> createState() => _RootWidgetPageState();
}

class _RootWidgetPageState extends State<RootWidgetPage> {
  final ConnectionService _connectionService = ConnectionService();
  @override
  void dispose() {
    _connectionService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _connectionService.initialize(navigatorKey);
    return MultiProvider(
      providers: [
        Provider<UserMobx>(create: (_) => UserMobx()..fetchUser()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        initialRoute: introPage,
        routes: {
          introPage: (context) => const IntroPage(),
          homePage: (context) => const HomePage(),
        },
      ),
    );
  }
}
