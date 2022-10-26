import 'package:flutter/material.dart';
import 'package:travelapp/core/const/def_theme.dart';
import 'package:travelapp/ui/screen/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',
      routes: {HomeScreen.routeName: (c) => const HomeScreen()},
      theme: DefTheme.themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
    );
  }
}
