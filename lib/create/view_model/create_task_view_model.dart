import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateTaskViewModel extends ChangeNotifier {

  DateTime? startDate;
  DateTime? dueDate ;
  List<String> taskTypes = ['Personal', 'Work', 'Study',"Meeting","Event"];
  String? selectedType;
  List<String> priorityOptions = ['Low', 'Medium', 'High'];
  String? selectedPriority;
  List<String> tags = [];
  XFile? attachement;

  void setStartDate(DateTime date) {
    startDate = date;
    notifyListeners();
  }

  void setDueDate(DateTime date) {
    dueDate = date;
    notifyListeners();
  }

  void setImage(XFile? image) {
    attachement = image;
    notifyListeners();
  }

  void saveTask(String title, String description) {
    // Here you would typically save the task to a database or API
    // For now, we just print the task details
    print('Task Title: $title');
    print('Task Description: $description');
    print('Start Date: $startDate');
    print('Due Date: $dueDate');
    print('Selected Type: $selectedType');
    print('Selected Priority: $selectedPriority');
    print('Tags: $tags');
    if (attachement != null) {
      print('Attachment: ${attachement!.path}');
    }
  }

  
}