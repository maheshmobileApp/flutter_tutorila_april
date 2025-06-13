import 'package:flutter/material.dart';
import 'package:flutter_tutorial_april/data/model/signUp_input_model.dart';
import 'package:flutter_tutorial_april/ui/core/ui/widgets/button_widget.dart';
import 'package:flutter_tutorial_april/ui/core/ui/widgets/input_text_widget.dart';
import 'package:flutter_tutorial_april/ui/signup/view_model/sign_up_view_model.dart';
import 'package:flutter_tutorial_april/utils/constants/alert_popup.dart';
import 'package:flutter_tutorial_april/utils/constants/loader.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isInvisible = true;

 late  SignUpViewModel signUpViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login Screen'),
      // ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                ),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5B67CA)),
                    )),
                const SizedBox(
                  height: 30,
                ),
                InputTextWidget(
                    hintText: "Enter Name", controller: nameController),
                        const SizedBox(
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
                  inputFormatters: const [
                    //  FilteringTextInputFormatter.digitsOnly,
                    // FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
                    // LengthLimitingTextInputFormatter(20),
                  ],
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  // maxLength: 120,
                  // maxLines: 5,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                  decoration: const InputDecoration(
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
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }  else {
                      return null;
                    }
                  },
                  controller: passwordController,
                  // onChanged: (value) {
                  //   print(value);
                  //
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: InkWell(
                        onTap: () {
                          if (isInvisible) {
                            setState(() {
                              isInvisible = false;
                            });
                          } else {
                            setState(() {
                              isInvisible = true;
                            });
                          }
                          print(isInvisible);

                          // isInvisible = !isInvisible;
                        },
                        child: isInvisible == true
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF2C406E),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  obscureText: isInvisible,
                  // readOnly: true,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text("Forgot Password?",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF5B67CA))))),
                ),
                ButtonWidget(
                    title: "Login",
                    onPressed: () {
                      signUpAction();
                    }),
                const SizedBox(
                  height: 20,
                ),
                dividerWidget(),
                dontHaveAccountWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dividerWidget() {
    return const Row(children: [
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
      const Text("Don’t have an account?"),
      TextButton(
          onPressed: () {},
          child: const Text("Sign Up",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF5B67CA))))
    ]);
  }

  @override
  void initState() {
    // TODO: implement initState
    signUpViewModel = Provider.of<SignUpViewModel>(context, listen: false);
    super.initState();

    // emailController.text = "test@gmail.com";
  }

  void signUpAction() async {
    if (_formKey.currentState == null) {
      print("form key is null");
      return;
    }
    if (_formKey.currentState!.validate() == false) {
      print("form is not valid");
      return;
    }


    SignUpInputModel payload = SignUpInputModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text);
    //Loader
    Loaders.circularShowLoader(context);
    final result = await signUpViewModel.signUp(payload);
    Loaders.circularHideLoader(context);
    print(result.data);
    //hide the loader
    if (result.status == false) {
      //Alert dialog
      alertPopup(context, result.message);
    } else {
      final data = result.data; //{message: Email already in use, error: true}
      final message = data['message'] ?? "Something went wrong";
      alertPopup(context, message);
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


View 

 */