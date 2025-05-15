import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
      return  Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Screen'),
      ),
      body: Container(
        child: Text("Sign up screen"),
      ),
    );
  }
}