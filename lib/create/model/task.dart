class Task {
  final String title;
  final String description;
  final String startDate;
  final String dueDate;
  final String priority;
  final String type;
  final String tag;
  final String? attachment;

  Task({required this.title, required this.description, required this.startDate, required this.dueDate, required this.priority, required this.type, required this.tag,  this.attachment});

}