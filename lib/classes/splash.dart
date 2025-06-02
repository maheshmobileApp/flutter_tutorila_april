import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Splash Screen ',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          // color: Colors.green,
          width: 200,
          height: 200,
          child: Text("This is child widget"),
          margin: EdgeInsets.only(left: 20, top: 20),
          padding: EdgeInsets.only(left: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.yellow],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            color: Colors.red,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.yellow,
              width: 5,
            ),
          )),
    );
  }
}
//"Splash Screen "
/*
div 
Container 
Width
height
child
decoration
color
padding ->
marging -> 
alignment


Column -> [1,2,3,4,5]
1. Image
2. Text
3. Text
4. Button
5. Button 
 */