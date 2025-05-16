
define the all routes in routes of MaterialApp
intial Route is the first page of the application


PUSH -> Pushed a new screeen on top of the stack 
POP -> popped the top screen from the stack

pushReplacement -> replaces the current screen with a new screen
// 1,2,3 -> 4 -> 1,2,4

pushAndRemoveUntil -> replaces the current screen with a new screen and removes all the previous screens from the stack
// 1,2,3 -> 4 -> 4
// OnBoaring -> Login -> Home
//PopUntil -> pops multiple screens from the stack until a certain route is reached
//1->2->3->4->5->6 

