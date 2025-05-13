import 'package:flutter/material.dart';

class RowAndColumn extends StatefulWidget {
  const RowAndColumn({ Key? key }) : super(key: key);

  @override
  _RowAndColumnState createState() => _RowAndColumnState();
}

class _RowAndColumnState extends State<RowAndColumn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Row and Column',
          style: TextStyle(
            color: Colors.orange,
          ))),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text("this test widget"),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.orange,
            ),
            // Container(
            //   width: 100,
            //   height: 100,
            //   color: Colors.blue,
            // ),
          ],
        ),
        
      ),
    );
  }
}

/*
Column: widget arranges its children in a vertical direction 

 */