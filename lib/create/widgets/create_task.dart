import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial_april/create/view_model/create_task_view_model.dart';
import 'package:flutter_tutorial_april/ui/core/ui/widgets/button_widget.dart';
import 'package:flutter_tutorial_april/ui/core/ui/widgets/input_text_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
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
    final viewModel = Provider.of<CreateTaskViewModel>(context);
    return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                    width: 200,
                    child: ButtonWidget(
                        title: 'Save',
                        onPressed: () {
                          createTaskViewModel.saveTask(
                            titleController.text,
                            descriptionController.text,
                          );
                        })),
              ),
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
                hintText: 'Start Date',
                controller: startDateController,
                isReadOnly: true,
                suffixIcon: InkWell(
                    onTap: () {
                      showTheStartDatePicker(viewModel);
                    },
                    child: const Icon(Icons.calendar_month)),
              ),
              const SizedBox(
                height: 10,
              ),
              InputTextWidget(
                  hintText: 'End Date',
                  controller: endDateController,
                  isReadOnly: true,
                  suffixIcon: InkWell(
                      onTap: () {
                        showTheEndDatePicker(viewModel);
                      },
                      child: const Icon(Icons.calendar_month))),
              const SizedBox(
                height: 10,
              ),
              // Add Priority Selection Button
              ElevatedButton(
                onPressed: selectPriority,
                child: Text(createTaskViewModel.selectedPriority != null
                    ? 'Priority: ${createTaskViewModel.selectedPriority}'
                    : 'Select Priority'),
              ),
              const SizedBox(
                height: 10,
              ),
              selectTypeOfTask(),
              const SizedBox(
                height: 10,
              ),
              attachmentView(viewModel),
              selectAttachment(),
            ],
          ),
        ));
  }

  Widget attachmentView(CreateTaskViewModel viewModel) {
    return viewModel.attachement != null
        ? Image.file(
            File(viewModel.attachement!.path),
            height: 100,
            width: 100,
          )
        : const Text("No Attachment Selected");
  }

  Widget selectTypeOfTask() {
    final tasksType = createTaskViewModel.taskTypes;
    return DropdownButtonFormField(
        value: createTaskViewModel.selectedType,
        hint: const Text("Please Select Task Type"),
        items: tasksType
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
        onChanged: (value) {
          createTaskViewModel.selectedType = value;
        });
  }

  Widget selectAttachment() {
    return ButtonWidget(
        title: "Select Attachment",
        onPressed: () {
          //Gallery or Camera
          chooseTheAttachmentType();
        });
  }

  chooseTheAttachmentType() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  takePicture(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.pop(context);
                  takePicture(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  takePicture(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: source);
    print(image?.path);
    createTaskViewModel.setImage(image);
  }



  showTheStartDatePicker(CreateTaskViewModel createTaskViewModel) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    ).then((selectedDate) {
      if (selectedDate != null) {
        final DateTime startDate = selectedDate;
        final DateFormat formatter = DateFormat('EEEE, MMM d, yyyy');
        final String formattedDate = formatter.format(startDate);
        startDateController.text = formattedDate;
        createTaskViewModel.setStartDate(selectedDate);
        // setState(() {
        //   startDateController.text = selectedDate.toLocal().toString().split(' ')[0];
        // });
      }
    });
  }

  showTheEndDatePicker(CreateTaskViewModel createTaskViewModel) {
    showDatePicker(
      context: context,
      initialDate: createTaskViewModel.startDate ?? DateTime.now(),
      firstDate: createTaskViewModel.startDate ?? DateTime.now(),
      lastDate: DateTime(2100),
    ).then((selectedDate) {
      if (selectedDate != null) {
        final DateTime startDate = selectedDate;
        final DateFormat formatter = DateFormat('MM/dd/yyyy');
        final String formattedDate = formatter.format(startDate);
        endDateController.text = formattedDate;
        createTaskViewModel.setDueDate(selectedDate);
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
                children:
                    createTaskViewModel.priorityOptions.map((String priority) {
                  return RadioListTile<String>(
                    title: Text(priority),
                    value: priority,
                    groupValue: createTaskViewModel.selectedPriority,
                    onChanged: (String? value) {
                      setDialogState(() {
                        createTaskViewModel.selectedPriority = value;
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
