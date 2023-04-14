import 'package:flutter/material.dart';
import 'user_screen.dart';
import 'user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injectable_me.dart';


void main() {
  configureInjection(Environment.prod);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final getIt = GetIt.instance;

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => getIt<UserViewModel>(),
          ),
        ],
      child: MaterialApp(
        title: 'MVVM Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UserScreen(),
      ),
    );
  }
}