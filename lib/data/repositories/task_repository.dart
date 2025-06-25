import 'package:flutter_tutorial_april/create/model/task.dart';

abstract class TaskRepository {
  Future<bool> saveTheTask(Task task);
  Future<List<Task>> getAllTasks();
}

//V- >VM-rep-serv