/*
https://api.restful-api.dev/objects

Request 

step 1:  find the what is http request method type - >  GET 
step 2: base url -> https://api.restful-api.dev
step 3: endpoint -> /objects
step 4: header -> no 
step 5: body (Get request does not have body) - (form data,x-www-form-urlencoded, raw,binary) -> no 
step 6: query parameters -> no 
step 7 : Authentication (Bearer token, Basic Auth, OAuth, etc.) -> no

 {
 key: value,
 key: value,
 } ->

 key -> string 
 value -> string, number, boolean, array, object

 {} -> json object
 [] -> json array
 '' -> json string
 45254-> json number
 true/false -> json boolean

 JSON
 XML 

 Response:
  JSON /XML 
  status code -> 200, 201, 400, 401, 403, 404, 500
  200 -> success
  201 -> created
  400 -> bad request
  401 -> unauthorized
  403 -> forbidden
  404 -> not found
  500 -> internal server error

  data -> 




 */

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class FetchMobiles extends StatefulWidget {
  const FetchMobiles({Key? key}) : super(key: key);

  @override
  _FetchMobilesState createState() => _FetchMobilesState();
}

class _FetchMobilesState extends State<FetchMobiles> {
  List<Map<String, dynamic>> mobiles = [];
  @override
  Widget build(BuildContext context) {
    print("build method called");

    return Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Mobiles'),
        ),
        body: ListView.builder(
          itemCount: mobiles.length,
          itemBuilder: (context, index) {
            final mobileData = mobiles[index]; // Access the mobile data
            print(mobileData); // id, name, data
            final name = mobileData['name'] ??
                ''; // Get the name or empty string if null;
            final data = mobileData['data'] ?? {};
            final color = data['color'] ?? ''; //color, capacity
            final capacity = data['capacity'] ?? ''; //
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    if (!color.isEmpty)
                      Text(
                        "Color: $color | $capacity",
                        style: const TextStyle(fontSize: 16),
                      ),
                  ],
                ),
              )),
            );
          },
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    print("init state called");
    fetchDataFromServer();
    super.initState();
  }

  void fetchDataFromServer() async {
    // step 1: define the base url
    String baseUrl = "https://api.restful-api.dev"; // dev,test,prod,stage
    // step 2: define the endpoint
    String endpoint = "/objects";
    // step 3: define the url
    String url = baseUrl + endpoint;

    // step 4: create a dio instance
    final dio = Dio();

    // step 5: make the get request
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      // step 6: handle the response
      // print("Response data: ${response.data}");
      setState(() {
        mobiles = List<Map<String, dynamic>>.from(response.data);
      });
      // You can parse the response data here
      // [] -> [ {id:"",name:"",data:{} },{},{} ]

      print(mobiles);
    } else {
      print("Error");
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}

/**

MVVM -> architecture pattern
Provider -> state management

1.Sign up
2.Login
3. Home Screen -> categories (inprogress,completed,pending,cancelled)
4. Create Tasks -> title, description, category, due date, priority,attachments(camera) -> (local storage)
5. View Task
6. Update Task
7. Delete Task
8. Logout

Relatime application 

Authentication Flow 
Splash Screen 
Loader 
Services Layer -> API calls, local storage, 

MVVM -> Model, View, ViewModel, repository, Services Layer
unit testing 
locallization
Resuble compoments 
Firbase push notifications -

Firbase -s au, storage, db 


 */