import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/user_store.dart';
import 'screen/payment_screen.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => UserStore()..fetchUsers()),
      ],
      child: MaterialApp(
        home: PaymentScreen(),
      ),
    );
  }
}
