/*
Loops: Lops are used to repeat a block of code multiple times.
For loop
For each loop
While loop
Do while loop
 */

void main() {

  /*
  for(initialization; condition; increment/decrement){
    //statements 
  }
  initialization: is executed only once
  condition: defines the condition for executing the loop
  increment/decrement: is executed after each iteration
   */

 // print numbers from 1 to 10
 for(int i = 1; i <= 10; i++){
 // print(i);
 }
//for each looop: it is used to iterate over a collection of elements
/*
for(var item in collection) {
}

List
Map
set 
 */
  List<String> names = ["John", "Jane", "Jack"];

  //  for (int i = 0; i < names.length; i++) {
  //   print(names[i]);

  // }

  for (var value in names) {
   // print(value);
  }

  //Break and continue
  //break: it is used to terminate the loop

  for (int i = 1; i <= 10; i++) {
    if (i == 5) {
      break;
    }
    print(i);
  }

  //continue: it is used to skip the current iteration
  // 1to 10 , skip 5
   for (int i = 1; i <= 10; i++) {
    if (i == 5) {
      continue;
    }
    print(i);
  }

}