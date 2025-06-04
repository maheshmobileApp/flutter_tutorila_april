import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_tutorial_april/ui/core/ui/widgets/button_widget.dart';
import 'package:flutter_tutorial_april/ui/core/ui/widgets/category_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial_april/ui/core/ui/widgets/slider_widget.dart';
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
        Expanded(flex: 6, child: _buildCarousel()),
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
          ButtonWidget(title: 'Login', onPressed: () {}),
          ButtonWidget(title: 'Sign Up', onPressed: () {})
        ]);
  }
}
