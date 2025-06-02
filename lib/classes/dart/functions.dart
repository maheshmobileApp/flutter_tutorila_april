/*
Functions are the block of code that perfroms a specific task

Avoid code repetition
Easy to divide the code into smaller parts
help to write a clean code 

returnType functionName(parameters) {
//function body
return value;
}

returnType: it tell you the function output type 
functionName: you can name function by any name.
 always follow a lowercamerCase convention
 parameters: are the input to the function 

 */
//no retun type no parameter
void main(){
 printHello();// calling the function 
 add(10, 20);
int value =  addValues(10, 46);
print(value);
// addValues1(a: 10);
// int? a;// a is null
addValues1(a: 10);
}

void printHello(){
  print("Hello");
}

void add(int a,int b){
 print(a + b);
}

int addValues(int a,int b){
  
  return a + b;
}

int addValues1({int? a, int b = 10}) {
 return a! + b;
}

// int addValues1({int? a, int? b}) {
//  return a! + b!;
// } 