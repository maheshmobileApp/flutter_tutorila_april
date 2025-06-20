import 'package:flutter/material.dart';

class CreateTaskViewModel extends ChangeNotifier {

  DateTime? startDate;
  DateTime? dueDate ;
  List<String> taskTypes = ['Personal', 'Work', 'Study',"Meeting","Event"];
  String? selectedType;
  List<String> priorityOptions = ['Low', 'Medium', 'High'];
  String? selectedPriority;
  List<String> tags = [];
  String? attachement;

  void setStartDate(DateTime date) {
    startDate = date;
    notifyListeners();
  }

  void setDueDate(DateTime date) {
    dueDate = date;
    notifyListeners();
  }

  
}