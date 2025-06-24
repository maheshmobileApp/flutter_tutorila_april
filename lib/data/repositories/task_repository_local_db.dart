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

}
/*

R
U
D

INSERT INTO task (title, description, startDate, dueDate, priority, type, tag) Values ('','')
 */