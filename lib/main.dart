import 'package:flutter/material.dart';
import 'package:udemy_meal_app/screens/categories_screen.dart';
import 'package:udemy_meal_app/screens/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
            bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1)
            ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabsScreen()
    );
  }
}

