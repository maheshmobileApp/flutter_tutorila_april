import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/clockIcon.png",),
            SizedBox(height: 30,),
            Text("Tracker App",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold,color: Color(0xFF5B67CA)),),
                        SizedBox(
              height: 20,
            ),

            Text("Plan what you will do to be more organized for today, tomorrow and beyond",
            textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    // fontStyle: FontStyle.italic,
                    // letterSpacing: 3,
                    // wordSpacing: 2,


                    fontWeight: FontWeight.w400,
                    color: Color(0xFF2C406E))),
                                SizedBox(
              height: 30,
            ),

            TextButton(onPressed: (){
              print("button pressed");
              Navigator.pushNamed(context, "/login");
            }, child: Container(
              width: double.infinity,
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(0xFF5B67CA),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text("Login",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )))   ,

                  TextButton(child: Text("Sign up",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,color: Color(0xFF5B67CA),
                      )),onPressed: (){
                                  Navigator.pushNamed(context, "/signup");

                  },)       
          ],
        ),
        

      ),
    );
  }
}
//5B67CA/*
// //  static const Color primary = Color(0xFF5B67CA);
//   static const Color textClor = Color(0xFF2C406E);

// */