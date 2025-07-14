import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_tutorial_april/routing/app_routes_names.dart';
import 'package:flutter_tutorial_april/ui/core/ui/widgets/button_widget.dart';
import 'package:flutter_tutorial_april/ui/core/ui/widgets/slider_widget.dart';
import 'package:flutter_tutorial_april/utils/constants/local_storate_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: _buildCarousel()),
        Expanded(flex: 1, child: _buildActionsWidget())
      ]),
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider(
      items: const [
        SliderWidget(
            imagePage: 'assets/amico.svg',
            title: 'Enjoy Your Time',
            subtitle:
                'when you are confused about managing your task come to us'),
        SliderWidget(
            imagePage: 'assets/Group.svg',
            title: 'Enjoy Your Time',
            subtitle:
                'when you are confused about managing your task come to us')
      ],
      options: CarouselOptions(

      ),
    );
  }

  Widget _buildActionsWidget() {


    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ButtonWidget(
              title: AppLocalizations.of(context)!.signIn,
              onPressed: () {
                Navigator.pushNamed(context, AppRoutesNames.login);
              }),
          ButtonWidget(
              title: AppLocalizations.of(context)!.signUp,
              onPressed: () {
                Navigator.pushNamed(context, AppRoutesNames.signup);
              })
        ]);
  }

  @override
  void initState() {
    super.initState();
    checkuserSession();
  }

  checkuserSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(LocalStorageConstants.token) ?? "";
    if (token.isNotEmpty) {
      // User is logged in, navigate to home screen
      Navigator.pushReplacementNamed(context, AppRoutesNames.bottomBar);
    } else {
      // User is not logged in, stay on welcome screen
      print("User is not logged in");
    }
  }
}
