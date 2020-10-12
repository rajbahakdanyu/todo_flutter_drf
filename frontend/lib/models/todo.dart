class Todo {
  int id;
  final String title;
  final bool completed;

  Todo({this.id, this.title, this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        id: json['id'], title: json['title'], completed: json['completed']);
  }
  dynamic toJson() => {'id': id, 'title': title, 'completed': completed};
}
