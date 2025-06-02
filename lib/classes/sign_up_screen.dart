import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int a = 10;
  @override
  Widget build(BuildContext context) {
      return  Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Screen'),
      ),
      body: Container(
        child:const Text("Sign up screen"),
      ),
    );
  }
}