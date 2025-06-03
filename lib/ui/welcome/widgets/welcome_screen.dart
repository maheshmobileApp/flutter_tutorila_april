
import 'package:flutter/material.dart';
import 'package:flutter_tutorial_april/ui/core/ui/widgets/button_widget.dart';
import 'package:flutter_tutorial_april/ui/core/ui/widgets/event_card_widget.dart';
import 'package:flutter_tutorial_april/ui/core/ui/widgets/input_text_widget.dart';

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
        Expanded(
            flex: 10,
            child: Container(
              child: Column(
                children: [
                  ButtonWidget(title: 'Login',
                   onPressed: () {}),
                  const SizedBox(
                    height: 10,
                  ),
                  ButtonWidget(title: 'Sign Up', onPressed: () {}),
                  InputTextWidget(
                    hintTex: 'Enter your email',
                    controller: TextEditingController(),
                    textInputType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email, color: Colors.grey),
                  ),
                  InputTextWidget(
                    hintTex: 'Enter your email',
                    controller: TextEditingController(),
                    textInputType: TextInputType.emailAddress,
                    suffixIcon:
                        const Icon(Icons.visibility, color: Colors.grey),
                  ),
                  const EventCardWidget(
                      title: 'Read a book about UI',
                      timings: '09:00 - 11:00 AM'),
                  const EventCardWidget(
                      backgroundColor: Colors.blue,
                      title: 'Read a book about UI',
                      timings: '09:00 - 11:00 AM'),
                  const EventCardWidget(
                      title: 'Read a book about UI',
                      timings: '09:00 - 11:00 AM'),
                  const EventCardWidget(
                      backgroundColor: Colors.blue,
                      title: 'Read a book about UI',
                      timings: '09:00 - 11:00 AM')
                ],
              ),
            ))
        ]
      ),
    );
  }
}