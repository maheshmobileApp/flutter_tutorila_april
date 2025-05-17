import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login Screen'),
      // ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
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
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (isValidEmail(value)) {
                    return null;
                  } else {
                    return 'Please enter a valid email';
                  }
                },
                inputFormatters: [
                  //  FilteringTextInputFormatter.digitsOnly,
                  // FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                  // LengthLimitingTextInputFormatter(20),
                ],
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                // maxLength: 120,
                // maxLines: 5,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    // labelText: "Email",
                    hintText: "Enter your email",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF2C406E),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (isValidPassword(value)) {
                    return null;
                  } else {
                    return 'Please enter a valid password';
                  }
                  
                },
                controller: passwordController,
                // onChanged: (value) {
                //   print(value);
                //
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: Icon(Icons.visibility_off),
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF2C406E),
                  ),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                // readOnly: true,
              ),
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
                    loginAction();
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
              SizedBox(
                height: 20,
              ),
              dividerWidget(),
              dontHaveAccountWidget()
            ],
          ),
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
    ]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // emailController.text = "test@gmail.com";
  }

  void loginAction() {

    print("login action called");
    final validate = _formKey.currentState!.validate();
    if (validate) {
      print("form is valid");
    } else {
      print("form is not valid");
    }
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool isValidPassword(String password) {
    final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    return passwordRegex.hasMatch(password);
  }

  
}

//Form 
/*
Create Sign up form with below fields

1. email -> vlidation
2. password -> validation
3. confirm password -> vlidation
4. first name -> min 3 char max 20 char 
5. last name -> min 3 char max 10 char
6. phone number -> validation
7. address -> optional



 */