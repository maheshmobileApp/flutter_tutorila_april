import 'package:flutter_tutorial_april/create/model/task.dart';
import 'package:flutter_tutorial_april/data/repositories/task_repository.dart';
import 'package:flutter_tutorial_april/data/services/local_db_service.dart';

class TaskRepositoryLocalDb  extends TaskRepository{

@override
  Future<bool> saveTheTask(Task task) async {
    final db = await DatabaseService.instance.database;
  //  db!.execute('''''');
    try {
      await db!.insert(
        DatabaseService.taskTable,
        {
          'task_title': task.title,
          'task_description': task.description,
          'task_start_date': task.startDate,
          'task_due_date': task.dueDate,
          'task_type': task.type,
          'task_priority': task.priority,
          'task_tags': '',
          'task_attachment': task.attachment,
          'isSync': 0,
        },
      );

      return true;
    } catch (e) {
      print('Error saving task: $e');
      return false;
    }
  }
  
  @override
  Future<List<Task>> getAllTasks() async {
    final db = await DatabaseService.instance.database;
    const String query = 'SELECT * FROM ${DatabaseService.taskTable}';
    final List<Map<String, dynamic>> taskData = await db!.rawQuery(query);
    List<Task> tasks = [];
    for (var element in taskData) {
      Task task = Task.fromJson(element);
      tasks.add(task);
    }
    print("data from local db: $taskData");
    // final List<Map<String, dynamic>> maps = await db!.query(DatabaseService.taskTable);
    return tasks;
  }

}
/*

[{task_id: 1, task_title: test, task_description: sdfasdfsa, task_start_date: 2025-06-24 00:00:00.000, task_due_date: 2025-06-26 00:00:00.000, task_type: Personal, task_priority: High, task_tags: , task_attachment: null, isSync: 0}, {task_id: 2, task_title: task 1, task_description: task details , task_start_date: 2025-06-26 00:00:00.000, task_due_date: 2025-06-28 00:00:00.000, task_type: Personal, task_priority: High, task_tags: , task_attachment: null, isSync: 0}]

R
U
D

INSERT INTO task (title, description, startDate, dueDate, priority, type, tag) Values ('','')
 */