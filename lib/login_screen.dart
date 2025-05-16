import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login Screen'),
      // ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5B67CA)),
                )),
            SizedBox(
              height: 30,
            ),
            TextFormField(),
            SizedBox(
              height: 20,
            ),
            TextFormField(),
          
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text("Forgot Password?",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF5B67CA))))),
            ),
            
            TextButton(
                onPressed: () {
                  print("button pressed");
                },
                child: Container(
                    width: double.infinity,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xFF5B67CA),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ))),
                    
                    SizedBox(height: 20,),

            dividerWidget(),
            dontHaveAccountWidget()
          ],
        ),
      ),
    );
  }

  Widget dividerWidget() {
    return Row(children: [
      Expanded(
          child: Divider(
        height: 2,
        color: Colors.lightBlue,
      )),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text("or With"),
      ),
      Expanded(
          child: Divider(
        height: 2,
        color: Colors.lightBlue,
      ))
    ]);
  }

  Widget dontHaveAccountWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text("Don’t have an account?"),
      TextButton(
          onPressed: () {},
          child: Text("Sign Up",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF5B67CA))))
    ]
    );
  }


}