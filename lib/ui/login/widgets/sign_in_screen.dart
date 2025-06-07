import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({ super.key });

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Container(),
    );
  }
}
