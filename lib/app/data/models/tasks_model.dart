class Tasks {
    Tasks({
      required this.id,
      required this.title,
      required this.isCompleted,
      required this.dueDate,
    });

    final int id;
    final String title;
    final int isCompleted;
    final String? dueDate;

    
    factory Tasks.fromJson(Map<String, dynamic> json) => Tasks(
        id: json["id"],
        title: json["title"],
        isCompleted: json["is_completed"],
        dueDate:json["due_date"] ?? '0000-00-00',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "is_completed": isCompleted,
        "due_date": dueDate,
    };
}
