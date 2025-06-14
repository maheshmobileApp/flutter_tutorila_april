import 'package:flutter/material.dart';
import 'package:flutter_tutorial_april/classes/api/provider/counter_provider.dart';
import 'package:flutter_tutorial_april/create/view_model/create_task_view_model.dart';
import 'package:flutter_tutorial_april/ui/core/ui/widgets/input_text_widget.dart';
import 'package:provider/provider.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  late CreateTaskViewModel createTaskViewModel;

  // Add priority selection variable
  String? selectedPriority;
  final List<String> priorityOptions = ['Low', 'Medium', 'High', 'Critical'];

  @override

  /// Initializes the state of the CreateTask widget.
  ///
  /// This method is called when the widget is first created. It sets up the
  /// CreateTaskViewModel using the Provider pattern, with listening disabled
  /// to prevent unnecessary rebuilds.
  void initState() {
    super.initState();
    createTaskViewModel =
        Provider.of<CreateTaskViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create Task"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              InputTextWidget(hintText: 'Title', controller: titleController),
              const SizedBox(
                height: 10,
              ),
              InputTextWidget(
                hintText: 'Description',
                controller: descriptionController,
                maxLines: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              InputTextWidget(
                hintText: '',
                controller: startDateController,
                isReadOnly: true,
                suffixIcon: InkWell(
                    onTap: () {
                      showTheStartDatePicker();
                    },
                    child: const Icon(Icons.calendar_month)),
              ),
              const SizedBox(
                height: 10,
              ),
              InputTextWidget(
                  hintText: '',
                  controller: endDateController,
                  isReadOnly: true,
                  suffixIcon: InkWell(
                      onTap: () {
                        showTheEndDatePicker();
                      },
                      child: const Icon(Icons.calendar_month))),
              const SizedBox(
                height: 10,
              ),
              // Add Priority Selection Button
              ElevatedButton(
                onPressed: selectPriority,
                child: Text(selectedPriority != null
                    ? 'Priority: $selectedPriority'
                    : 'Select Priority'),
              ),
            ],
          ),
        ));
  }

  showTheStartDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    ).then((selectedDate) {
      if (selectedDate != null) {
        createTaskViewModel.setStartDate(selectedDate);
        // setState(() {
        //   startDateController.text = selectedDate.toLocal().toString().split(' ')[0];
        // });
      }
    });
  }

  showTheEndDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: createTaskViewModel.startDate ?? DateTime.now(),
      lastDate: DateTime(2100),
    ).then((selectedDate) {
      if (selectedDate != null) {
        // setState(() {
        //   startDateController.text = selectedDate.toLocal().toString().split(' ')[0];
        // });
      }
    });
  }

  selectPriority() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Priority'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setDialogState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: priorityOptions.map((String priority) {
                  return RadioListTile<String>(
                    title: Text(priority),
                    value: priority,
                    groupValue: selectedPriority,
                    onChanged: (String? value) {
                      setDialogState(() {
                        selectedPriority = value;
                      });
                    },
                  );
                }).toList(),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // Update the main widget state
                });
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }
}

// start 14
// end 15:00

//Create Task - title, description,start date,   dueDate, priority , attachments, type and tags

// calendar date picker
// radio button for priority
// dropdown for type
// camera / gallery for attachments

/*
class _CreateTaskState extends State<CreateTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  late CreateTaskViewModel createTaskViewModel;
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      createTaskViewModel = Provider.of<CreateTaskViewModel>(context);
      _isInitialized = true;
      // Any initialization logic here
    }
  }

  // Rest of the code remains the same...
}

 */
