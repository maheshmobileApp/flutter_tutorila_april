import 'package:flutter/material.dart';
import 'splash.dart';
import 'row_and_column.dart';
void main() {
  // Entry point of the application
  runApp(MyApp()); // pass the widget to the runApp method
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RowAndColumn()
    );
  }
}

//Launching lib/main.dart on Chrome in debug mode...
//widget is the base class for all widgets in flutter
// widget is a class that is used to create a user interface in flutter
//widget are two types -> 1. stateless widget 2. stateful widget
/*
1. Container
2. Text
3. Image
4. Icon
5. Row
6. Column
7. Stack
8. ListView
9. GridView
10. Card
11. scaffold
12. AppBar
13. BottomNavigationBar
14. TextField

FIGMA 

Login scren- > em, pass, login, fb, g+ 

 */