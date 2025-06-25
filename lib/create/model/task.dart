class Task {
  int? taskId;
  String title;
  String description;
  String startDate;
  String dueDate;
  String priority;
  String type;
  String tag;
  String? attachment;
  int isSync;

  Task({
    this.taskId,
    required this.title,
    required this.description,
    required this.startDate,
    required this.dueDate,
    required this.priority,
    required this.type,
    required this.tag,
    this.attachment,
    this.isSync = 0,
  });

  Task.fromJson(Map<String, dynamic> json)
      : taskId = json['task_id'],
        title = json['task_title'] ?? '',
        description = json['task_description'] ?? '',
        startDate = json['task_start_date'] ?? '',
        dueDate = json['task_due_date'] ?? '',
        priority = json['task_priority'] ?? '',
        type = json['task_type'] ?? '',
        tag = json['task_tags'] ?? '',
        attachment = json['task_attachment'],
        isSync = json['isSync'] ?? 0;

  Map<String, dynamic> toJson() {
    return {
      'task_id': taskId,
      'task_title': title,
      'task_description': description,
      'task_start_date': startDate,
      'task_due_date': dueDate,
      'task_type': type,
      'task_priority': priority,
      'task_tags': tag,
      'task_attachment': attachment,
      'isSync': isSync,
    };
  }

}
