/*
In object-oriented programming, a class is a blueprint for creating objects.
A class defines the properties and methods 

class ClassName {

//properties
//methods
ClassName() {
//body of the constructor
}
}

The class keyword is used to define a class in Dart.
ClassNames is the name of the class and must start with an uppercase letteter.
body of the class is enclosed in curly braces.
body of the class contains properties and methods.
Properties are used to store data. it is also knows as fields or attributes.
Functions are used to perform actions, it is also knows as methods.
 */
class Person {
  String? name;
  int? age;
  String? address;
  Person.createUser(String userName, int userAge){
    name = userName;
    age = userAge;
  }

  Person(String userName, int userAge, String userAddress) {
    name = userName;
    age = userAge;
     address = userAddress;
  }

  void display() {
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
  }
}

void main() {
  // Creating an object of the class
  // ClassName objectName = ClassName();
  Person person =  Person("John", 20, "New York");
 Person person1 = Person.createUser("John", 20);
 person1.display();
  //  person.name = "John";
  //  person.age = 20;
  //  person.address = "New York";

   person.display();

   //Constructor
   //Constructor is a special method that is used to initialize the object of the class.
   //Constructor has the same name as the class name.
   //Constructor does not have a return type.

// we can create multiple constructors in java,c++
   //but in dart we can create only one constructor
   //but we can use named constructor to create multiple constructors
   //named constructor is a constructor that has a name other than the class name.
   //className.constructorName()
   
}