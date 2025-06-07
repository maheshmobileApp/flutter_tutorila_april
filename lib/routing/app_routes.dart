
import 'package:flutter/material.dart';
import 'package:flutter_tutorial_april/routing/app_routes_names.dart';
import 'package:flutter_tutorial_april/ui/bottom_bar/bottom_bar.dart';
import 'package:flutter_tutorial_april/ui/login/widgets/sign_in_screen.dart';
import 'package:flutter_tutorial_april/ui/signup/widgets/sign_up_screen.dart';
import 'package:flutter_tutorial_april/ui/welcome/widgets/welcome_screen.dart';

class AppRoutes {

  static   Map<String, WidgetBuilder>  appRoutes = {
    // Define your app routes here
    AppRoutesNames.welcome  : (context) => const WelcomeScreen(),
    AppRoutesNames.login    : (context) => const SignInScreen(),
    AppRoutesNames.signup   : (context) => const SignUpScreen(), // 
    AppRoutesNames.bottomBar: (context) => const BottomBarView()
  };

}