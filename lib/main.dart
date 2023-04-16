import 'package:flutter/material.dart';
import 'package:module_business/module_business.dart';
import 'package:module_data/module_data.dart';
import 'package:provider/provider.dart';
import 'package:state_management/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: ((context) =>
              CartState(const ProductRepository(), const CartRepository())),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(
          title: 'Flutter Demo Home Page',
        ),
      ),
    );
  }
}
