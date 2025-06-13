import 'package:flutter/material.dart';
import 'package:flutter_tutorial_april/data/model/signIn_input_model.dart';
import 'package:flutter_tutorial_april/routing/app_routes_names.dart';
import 'package:flutter_tutorial_april/utils/constants/alert_popup.dart';
import 'package:flutter_tutorial_april/utils/constants/loader.dart';
import 'package:flutter_tutorial_april/utils/constants/local_storate_constant.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/ui/widgets/button_widget.dart';
import '../../core/ui/widgets/input_text_widget.dart';
import '../view_model/sign_in_view_model.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({ super.key });

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isInvisible = true;
  late SignInViewModel signInViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
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
                  hintText: "Enter your email",
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (isValidEmail(value)) {
                      return null;
                    } else {
                      return 'Please enter a valid email';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                InputTextWidget(
                  hintText: "Enter your password",
                  controller: passwordController,
                  textInputType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.password),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (isValidPassword(value)) {
                      return null;
                    } else {
                      return 'Please enter a valid password';
                    }
                  },
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
                      },
                      child: isInvisible == true
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility)),
                  isPasswordVisible: isInvisible,
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
                    loginAction();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                dividerWidget(),
                // dontHaveAccountWidget()
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
        padding: EdgeInsets.symmetric(horizontal: 20),
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
      ButtonWidget(
        title: "Sign Up",
        onPressed: () {},
      ),
    ]);
  }

  @override
  void initState() {
    signInViewModel = Provider.of<SignInViewModel>(context, listen: false);
    emailController.text = "mahesh@mailsac.com";
    passwordController.text = "password123";
    super.initState();
  }

  void loginAction() async {
    if (_formKey.currentState == null) {
      print("form key is null");
      return;
    }
    if (_formKey.currentState!.validate() == false) {
      print("form is not valid");
      return;
    }
    SignInInputModel payload = SignInInputModel(
        email: emailController.text, password: passwordController.text);
    Loaders.circularShowLoader(context);
    final result = await signInViewModel.login(payload);
    Loaders.circularHideLoader(context);

    print(result.data);
    //hide the loader
    if (result.status == false) {
      //Alert dialog
      alertPopup(context, result.message);
    } else {
      final data = result.data;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = data['token'] ?? "";
      final student = data['student'] ?? {};
      final studentId = student['id'] ?? "";
      final studentName = student['name'] ?? "";
      final studentEmail = student['email'] ?? "";
      prefs.setString(LocalStorageConstants.token, token);
      prefs.setString(LocalStorageConstants.userId, studentId);
      prefs.setString(LocalStorageConstants.userName, studentName);
      prefs.setString(LocalStorageConstants.userEmail, studentEmail);
      Navigator.pushNamed(context, AppRoutesNames.bottomBar);
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

/*


{token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4NDY0YzMzY2JmOWVmNTJhMGUzYjc0OCIsImlhdCI6MTc0OTc4MzA0OSwiZXhwIjoxNzQ5Nzg2NjQ5fQ.Ro5svLr_c3PRfbu6Tq-cpmeJE9Bhny3pNH42BnQLJ8s, 
error: false, 
student: {id: 68464c33cbf9ef52a0e3b748, name: mahesh, email: mahesh@mailsac.com}}
 */