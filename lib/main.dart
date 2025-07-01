import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial_april/create/view_model/create_task_view_model.dart';
import 'package:flutter_tutorial_april/data/repositories/login_repository_impl.dart';
import 'package:flutter_tutorial_april/data/repositories/task_repository_local_db.dart';
import 'package:flutter_tutorial_april/firebase_options.dart';
import 'package:flutter_tutorial_april/routing/app_routes.dart';
import 'package:flutter_tutorial_april/routing/app_routes_names.dart';
import 'package:flutter_tutorial_april/ui/login/view_model/sign_in_view_model.dart';
import 'package:flutter_tutorial_april/ui/signup/view_model/sign_up_view_model.dart';
import 'package:provider/provider.dart';

import 'classes/api/provider/counter_provider.dart';

void main()async {
  // Entry point of the application
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp()); // pass the widget to the runApp method
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
          
        ),
        ChangeNotifierProvider(
          create: (context) =>
              SignUpViewModel(loginRepository: LoginRepositoryImpl()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              SignInViewModel(loginRepository: LoginRepositoryImpl()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              CreateTaskViewModel(taskRepository: TaskRepositoryLocalDb()),
        ),
        // Add other providers here if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.appRoutes,
        initialRoute: AppRoutesNames.welcome,
      ),
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


 // routes: {
        //   "/splash": (context) => SplashScreen(),
        //   "/login": (context) => LoginScreen(),
        //   "/signup": (context) => SignUpScreen(),
        //   "/welocme": (context) => WelcomeScreen(),
        //   "/home": (context) => HomeScreen(),
        //   "/listview": (context) => ListviewScreen(),
        //   "/counterWithProvider": (context) => CounterApp(),
        //   '/dynamicList': (context) => DynamicListView(),
        //   '/expandedWidget': (context) => ExpandedWidget(),
        //   '/fetchMobiles': (context) => FetchMobiles(),
        //   '/counterAppWithProvider': (context) => CounterAppWithProvider(),
      
        // },

 */