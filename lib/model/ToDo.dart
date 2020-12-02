class ToDoList {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  ToDoList({this.userId, this.id, this.title, this.completed});

  factory ToDoList.fromJson(Map<String, dynamic> json) {
    return ToDoList(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }
}
