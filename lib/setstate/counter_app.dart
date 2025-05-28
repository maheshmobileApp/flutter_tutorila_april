
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
// HTTP -> Hypertext Transfer Protocol


/*

HTPP Methods -> GET, POST, PUT, DELETE, PATCH, HEAD, OPTIONS

Request 

step 1:  find the what is http request method type - > 
step 2: base url 
step 3: endpoint
step 4: header
step 5: body (Get request does not have body) - (form data,x-www-form-urlencoded, raw,binary)
step 6: query parameters
step 7 : Authentication (Bearer token, Basic Auth, OAuth, etc.)





Response 



******


Request 

step 1:  find the what is http request method type - >  POST
step 2: base url -> https://bnbevf6nveriumvumwe6jo6ism0ozogr.lambda-url.eu-north-1.on.aws/
step 3: endpoint -> students/login
step 4: header -> No header
step 5: body (Get request does not have body) - (form data,x-www-form-urlencoded, raw,binary)
 raw {
  "email": "maheshy@example.com",
  "password": "123456"
}

step 6: query parameters -No
step 7 : Authentication (Bearer token, Basic Auth, OAuth, etc.) -> no 


 */