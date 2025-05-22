//Listview is a scrollable list of widgets arranged linearly.

//types
// 1. ListView
// 2. ListView.builder
// 3. ListView.separated
// 4. ListView.custom

import 'dart:math';

import 'package:flutter/material.dart';

class ListviewScreen extends StatefulWidget {
  const ListviewScreen({Key? key}) : super(key: key);

  @override
  _ListviewState createState() => _ListviewState();
}

class _ListviewState extends State<ListviewScreen> {

  final states = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttarakhand",
    "Uttar Pradesh",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
  ];
  final Random _random = Random();

  // Function to generate random colors
  Color _getRandomColor() {
    return Color.fromRGBO(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      1.0,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Container(
          height: 10,
         decoration: BoxDecoration(
              color: _getRandomColor(),
              borderRadius: BorderRadius.circular(10),
            ),

        ),
        itemCount: states.length,
        itemBuilder: (context, index) {
          final data = states[index];
          return InkWell(
            onTap: () {
              print("Tapped on $data");
              showTheAlertDialog(context, data);
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                   color: _getRandomColor(),
                  borderRadius: BorderRadius.circular(10),
                ),
                     margin: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  data,
                  style: const TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        
        
      },)
    );
  }

  showTheAlertDialog(BuildContext context,String data) 
    {
       showDialog(context: context, builder: (context) {
         return AlertDialog(
            title: const Text("Alert"),
            content: Text("You tapped on $data"),
            actions: [
              TextButton(
                onPressed: () {
                Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
            ],
         );
       },);

    }
  
}

/*

ListView(
        children: List.generate(states.length, (index) {
          final data = states[index];
          return Container(
            margin: const EdgeInsets.all(10),
            child: Text("${index + 1} $data"),
          );
        }),
      )

ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            height: 100,
            color: Colors.red,
            child: const Center(child: Text('Item 1')),
          ),
          Container(
            height: 100,
            color: Colors.green,
            child: const Center(child: Text('Item 2')),
          ),
          Container(
            height: 100,
            color: Colors.blue,
            child: const Center(child: Text('Item 3')),
          ),
          Container(
            height: 100,
            color: Colors.yellow,
            child: const Center(child: Text('Item 4')),
          ),
          Container(
            height: 100,
            color: Colors.green,
            child: const Center(child: Text('Item 2')),
          ),
          Container(
            height: 100,
            color: Colors.blue,
            child: const Center(child: Text('Item 3')),
          ),
          Container(
            height: 100,
            color: Colors.yellow,
            child: const Center(child: Text('Item 4')),
          ),
          Container(
            height: 100,
            color: Colors.green,
            child: const Center(child: Text('Item 2')),
          ),
          Container(
            height: 100,
            color: Colors.blue,
            child: const Center(child: Text('Item 3')),
          ),
          Container(
            height: 100,
            color: Colors.yellow,
            child: const Center(child: Text('Item 4')),
          ),
          Container(
            height: 100,
            color: Colors.green,
            child: const Center(child: Text('Item 2')),
          ),
          Container(
            height: 100,
            color: Colors.blue,
            child: const Center(child: Text('Item 3')),
          ),
          Container(
            height: 100,
            color: Colors.yellow,
            child: const Center(child: Text('Item 4')),
          ),
        ],
      ),
 */