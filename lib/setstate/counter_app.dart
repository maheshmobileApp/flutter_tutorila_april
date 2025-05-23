
import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({ Key? key }) : super(key: key);

  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    print("Build method called");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App with SetState'),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Counter values is $counter",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),),
            TextButton(onPressed: (){
              incrementCounter();
            }, child: Text("Increment",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w800))),
                        TextButton(onPressed: () {
                          decrementCounter();
                        }, child: Text("Decrement",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w800))),

          ],
        ),
      ),
    );
  }

  void incrementCounter()
    {
     
      
     setState(() {
         counter = counter + 1;
     });
      // counter++;
      print("counter is $counter");
    }

    void decrementCounter(){
      setState(() {
            counter = counter - 1;

      });
          print("counter is $counter");

    // counter--;
    }
}

//View
// Business Logic

//MVVM 