import 'dart:convert';

class Task {
    Task({
        required this.id,
        required this.title,
        required this.isCompleted,
        required this.dueDate,
        required this.comments,
        required this.description,
        required this.tags,
        required this.token,
        required this.createdAt,
        required this.updatedAt,
    });

    final int id;
    final String title;
    final int isCompleted;
    final DateTime dueDate;
    final String comments;
    final String description;
    final String tags;
    final String token;
    final DateTime createdAt;
    final DateTime updatedAt;

    factory Task.fromRawJson(String str) => Task.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        isCompleted: json["is_completed"],
        dueDate: DateTime.parse(json["due_date"]),
        comments: json["comments"],
        description: json["description"],
        tags: json["tags"],
        token: json["token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "is_completed": isCompleted,
        "due_date": "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
        "comments": comments,
        "description": description,
        "tags": tags,
        "token": token,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
