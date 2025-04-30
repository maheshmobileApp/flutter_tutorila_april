/*
String help you to store text data  
it holds a sequence of characters
 */

void main(){

  String htmlData = ''' <!DOCTYPE html>
<html>
<head>
<title>Page Title</title>
</head>
<body>

<h1>This is a Heading</h1>
<p>This is a paragraph.</p>

</body>
</html>
 ''';

 //Properties: 
 //length: it returns the length of the string
  print( htmlData.length);
  //isEmpty: it returns true if the string is empty, false otherwise
   //isNotEmpty: it returns true if the string is not empty, false otherwise

   //Methods:
   //toLowerCase: it returns the string in lowercase
   //toUpperCase: it returns the string in uppercase
   //trim: it removes the leading and trailing whitespace from the string
   //replaceAll: it replaces all occurrences of a substring with another substring

   // "Hello This is flutter class".replaceAll("flutter", "dart");
   //split: it splits the string into an array of substrings

   String location = "17.09| 78.09";
 List<String> latAndLong =  location.split("|");// List<String> = ["17.09", "78.09"]
 String lat = latAndLong[0];
 String long = latAndLong[1];

 //subString: it returns a substring of the string
 //substring(startIndex, endIndex): it returns a substring of the string from startIndex to endIndex-1
 String id = "AHS1234567890";// 12345678 
 print(id.substring(3, 11));



}