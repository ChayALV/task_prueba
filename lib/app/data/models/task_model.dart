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
    final String dueDate;
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
        dueDate: json["due_date"] ?? '0000-00-00',
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
        "due_date": dueDate,
        "comments": comments,
        "description": description,
        "tags": tags,
        "token": token,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
