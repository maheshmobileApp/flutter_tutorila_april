/*
List
Map
Set

 */

void main(List<String> args) {
  //if you want to store multiple values in a single variable, then you can use List
  //list is similar to array in other programming languages
  //List is represented by square brackets []

  List<int> numbers = [1, 2, 3, 4, 5];

  //properties of list
  //length: it returns the number of elements in the list
  print(numbers.length);
  //first: it returns the first element of the list
  print(numbers.first);
  print(numbers[0]);
  //last: it returns the last element of the list
  print(numbers.last);
  print(numbers[numbers.length - 1]);
  //isEmpty: it returns true if the list is empty

  //add, addAll, insert, insertAlll
  numbers.add(100);
  numbers.addAll([10, 20, 30]);
  numbers.insert(0, 1000); // index,value
  numbers.insertAll(0, [1000, 2000, 3000]);

  //Remove, removeAt, removeLast, removeRange
  numbers.remove(1000);
  numbers.removeAt(0);
  numbers.removeLast();
  numbers.removeRange(0, 3);// start index, end index
  numbers.clear();

  //Map: data is stored in key value pair.
  //key must be unique
  // similar to dictionary in python,HashMaps in java

  //Map is represented by curly braces {}
  //Map<keyType, valueType> 
  Map<String, dynamic> person = {
    "name": "John",
    "age": 20,
    "isMarried": false,
    };

    //keys are unique

    //properties of Map
    //length: it returns the number of elements in the map
    print(person.length);
    //keys: it returns the keys of the map
    print(person.keys);
    //values: it returns the values of the map
    print(person.values);
    //isEmpty: it returns true if the map is empty

     print(person["name"]);
     print(person["phone"]);
     print(person.containsKey("phone"));
     person["phone"] = "1234567890";
     print(person);
     person.remove("phone");
     print(person);


}
