import 'package:flutter/material.dart';
import 'package:flutter_tutorial_april/create/model/task.dart';
import 'package:flutter_tutorial_april/data/repositories/task_repository.dart';
import 'package:image_picker/image_picker.dart';

class CreateTaskViewModel extends ChangeNotifier {
  TaskRepository taskRepository;
  CreateTaskViewModel({required this.taskRepository});

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
    final task = Task(
        title: title,
        description: description,
        startDate: startDate.toString(),
        dueDate: dueDate.toString(),
        priority: selectedPriority ?? '',
        type: selectedType ?? '',
        tag: '');
    final response = taskRepository.saveTheTask(task);
  }

  
}

/*

View -> collect the data from the user 
ViewModel -> handle the logic and state management
Model -> model class for the task data
repository -> handle the data operations (CRUD) with the local database or API

api 

sqflite - save the data in the local database 

Task_table 

task_id
task_title
task_description
task_start_date
task_due_date
task_type
task_priority
task_tags
task_attachment

C
R
U
D 
 */