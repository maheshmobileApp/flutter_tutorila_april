
import 'package:flutter/material.dart';
import 'package:flutter_tutorial_april/ui/core/ui/widgets/button_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key}) ;

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Column(
        children:[
          Expanded(
            flex: 6,
            child: Container()),
             Expanded(flex: 2, child: Container(
              child: Column(
                children: [
                  ButtonWidget(title: 'Login',

                   onPressed: (){}),
                  const SizedBox(height: 20,),
                   ButtonWidget(title: 'Sign Up', onPressed: () {}),
                        const SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(title: 'Sign Up', onPressed: () {})

                ],
              ),
             ))
          
        ]
      ),
    );
  }
}