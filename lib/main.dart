import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:module_business/module_business.dart';
import 'package:module_data/module_data.dart';
import 'package:redux/redux.dart';
import 'package:state_management/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.loading(),
    middleware: createStoreMiddleware(),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/": (context) {
            return HomePage(
              title: 'Flutter Demo Home Page',
              onInit: () {
                StoreProvider.of<AppState>(context)
                    .dispatch(GetProductsEvent());
              },
            );
          },
        },
      ),
    );
  }
}
