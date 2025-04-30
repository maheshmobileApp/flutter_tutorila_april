/*
Excute a speciific code if a condition is true, in that case you can use conditons
if
if else
if else if
switch


 */
void main() {
  /*
  if(condition){

  }
   */
  int age = 10;
  if(age >= 18){
    print("You are eligible to vote");
  }else{
    print("You are not eligible to vote");
  }

  //Ternary Operator
  //condition ? expression1 : expression2

  age >= 18 ? print("You are eligible to vote") : print("You are not eligible to vote");

  // when you have multiple conditions, then you can use if else if

  int marks = 70;
   if(marks >= 90) {
  print("A++");
   }else if(marks >= 80) {
    print("A+");
   }else if(marks >= 70) {
    print("A");
   }else if(marks >= 60) {
    print("B+");
   }
   else if(marks >= 50) {
    print("B");
   }
   else if(marks >= 40) {
    print("C");
   }
   else if(marks >= 30) {
    print("D");
   }
   else{
    print("F");
   }
//Switch  case
  int day = 6;
  switch(day){
    case 1:
      print("Monday");
      break;
    case 2:
      print("Tuesday");
      break;
    case 3:
      print("Wednesday");
      break;
    case 4:
      print("Thursday");
      break;
    case 5:
      print("Friday");
      break;
    case 6:
      print("Saturday");
      break;
    case 7:
      print("Sunday");
      break;
    default:
      print("Invalid day");
  }
  
}