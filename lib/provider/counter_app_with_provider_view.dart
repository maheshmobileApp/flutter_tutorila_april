import 'package:flutter/material.dart';
import 'package:flutter_tutorial_april/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterAppWithProvider extends StatefulWidget {
  const CounterAppWithProvider({Key? key}) : super(key: key);

  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterAppWithProvider> {
  
  @override
  Widget build(BuildContext context) {

    final counterProvider =  Provider.of<CounterProvider>(context);

    print("Build method called");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App with SetState'),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
              "Counter values ${counterProvider.counter}",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
            TextButton(
                onPressed: () {
               //   incrementCounter();
                  

                  counterProvider.incrementCounter();

                 
                },
                child: Text("Increment",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w800))),
            TextButton(
                onPressed: () {
                 // decrementCounter();
                 counterProvider.decrementCounter();
                },
                child: Text("Decrement",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w800))),
          ],
        ),
      ),
    );
  }

  
}

/*

VIEW -> display counter value, increment and decrement buttons
Logic Part -> incrementCounter, decrementCounter-> CounterProvider class 

step 1 : create view with Text, buttons for increment and decrement
step 2 : create class CounterProvider with ChangeNotifier
step 3 :intialize the counter variable and create incrementCounter and decrementCounter method in CounterProvider class
step 4 : access the CounterProvider class in the view using Provider.of<CounterProvider>(context)
step 5 : call the incrementCounter and decrementCounter method in the view
 */