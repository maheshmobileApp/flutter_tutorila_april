import 'package:flutter/material.dart';
import 'package:flutter_tutorial_april/create/view_model/create_task_view_model.dart';
import 'package:flutter_tutorial_april/utils/constants/alert_popup.dart';
import 'package:provider/provider.dart';

class TasksList extends StatefulWidget {
  const TasksList({ Key? key }) : super(key: key);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    final taskVm = Provider.of<CreateTaskViewModel>(context);
    return Scaffold(
        body: ListView.builder(
      itemCount: taskVm.tasks.length,
      itemBuilder: (context, index) {
        final task = taskVm.tasks[index];
        return Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(task.title),
              subtitle: Text(task.description),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  deleteTask(task.taskId ?? 0);
                },
              ),
            ),
          ),
        );
        
      },
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchAllTasks();
    super.initState();
  }

  fetchAllTasks() async {
    final taskVm = Provider.of<CreateTaskViewModel>(context, listen: false);
    await taskVm.getAllTasks();
  }

  deleteTask(int taskId) async {
    alertConfirmPopup(context, "Are you sure you want to delete this task?",
        okAction: () async {
      Navigator.pop(context);
      final taskVm = Provider.of<CreateTaskViewModel>(context, listen: false);
      await taskVm.deleteTask(taskId);
    }, cancelAction: () {
      Navigator.pop(context);
    });
  }
}
