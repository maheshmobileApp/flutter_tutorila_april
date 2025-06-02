import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    print(args);
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Container(
         child: Column(
          children: [
            Text("Welcome to Home Screen $args"),
            TextFormField(
              controller: textController,
              
            ),
            TextButton(
                onPressed: () {
                 Navigator.pop(context, {'email': textController.text,
                    });
                },
                child: Container(
                    width: double.infinity,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xFF5B67CA),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Back to Login",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ))),

            // Text("Welcome ${args['email']}"),
            //   Text("Welcome ${args['password']}"),
          ],
         ),
      ),
    );
  }
}