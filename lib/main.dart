import 'package:flutter/material.dart';
import 'package:flutter_tutorial_april/expanded_widget.dart';
import 'package:flutter_tutorial_april/setstate/dynamic_todo_list.dart';
import 'package:flutter_tutorial_april/welcome_screen.dart';
import 'splash.dart';
import 'login_screen.dart';
import 'sign_up_screen.dart';
import 'home_screen.dart';
import 'listview/listview.dart';
import 'setstate/counter_app.dart';

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
      initialRoute: "/welocme",
      routes: {
        "/splash":(context) => SplashScreen(),
        "/login":(context) => LoginScreen(),
        "/signup":(context) => SignUpScreen(),
        "/welocme":(context) => WelcomeScreen(),
        "/home": (context) => HomeScreen(),
        "/listview": (context) => ListviewScreen(),
        "/counterWithProvider": (context) => CounterApp(),
        '/dynamicList': (context) => DynamicListView(),
        '/expandedWidget': (context) => ExpandedWidget(),

      },
    );
  }
}
//When using initialRoute, don't define a home property.

//Launching lib/main.dart on Chrome in debug mode...
//widget is the base class for all widgets in flutter
// widget is a class that is used to create a user interface in flutter
//widget are two types -> 1. stateless widget 2. stateful widget
/*
"" -> String
[] -> List
 {} -> key value pairs 

Welcome  -> route names 
Login
Signup
home
profile 


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