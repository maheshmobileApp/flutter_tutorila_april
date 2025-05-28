import 'package:flutter/material.dart';

class ExpandedWidget extends StatefulWidget {
  const ExpandedWidget({ Key? key }) : super(key: key);

  @override
  _ExpandedWidgetState createState() => _ExpandedWidgetState();
}

class _ExpandedWidgetState extends State<ExpandedWidget> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.red,
              child: Text("Container 1"),
             
              width: double.infinity,
            ),
          ),
           Expanded(
            flex: 2,
             child: Container(
                color: Colors.blue,
                            child: Text("Container 2"),
             
                width: double.infinity,
              ),
           ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.orange,
                child: Text("Container 2"),
                width: double.infinity,
              ),
            ),
              Expanded(
              flex: 10,
              child: Container(
                color: Colors.yellow,
                child: Text("Container 2"),
                width: double.infinity,
              ),
            ),
        ],
      )
    );
  }
}