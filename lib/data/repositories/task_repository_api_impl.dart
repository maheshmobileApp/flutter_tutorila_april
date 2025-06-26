import 'package:flutter_tutorial_april/create/model/task.dart';
import 'package:flutter_tutorial_april/data/repositories/task_repository.dart';

class TaskRepositoryApiImpl extends TaskRepository {
  @override
  Future<bool> saveTheTask(Task task) {
    // TODO: implement saveTheTask
    throw UnimplementedError();
  }
  
  @override
  Future<List<Task>> getAllTasks() {
    // TODO: implement getAllTasks
    throw UnimplementedError();
  }
  
  @override
  Future<bool> deleteTask(int taskId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }
}