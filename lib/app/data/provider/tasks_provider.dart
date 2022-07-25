import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_app_prueba/app/data/models/tasks_model.dart';
import 'package:task_app_prueba/app/ui/utils/utilits.dart';

class TasksApi extends GetConnect {

  static const String baseUrlOfTasks = 'ecsdevapi.nextline.mx';
  Uri formatUrl = Uri.https(baseUrlOfTasks, 'vdev/tasks-challenge/tasks', params);

  getTask() async {

    List<Tasks> tasks = [];
    final response = await http.get(formatUrl,headers: headers);

    for (var task in jsonDecode(response.body)) {
      tasks.add(Tasks.fromJson(task));
    }

    return tasks;
  } 

}
