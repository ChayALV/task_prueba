import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_app_prueba/app/data/models/task_model.dart';
import 'package:task_app_prueba/app/ui/utils/utilits.dart';

class TaskApi extends GetConnect {


  getTaskById(int id) async {

    Uri formatUrl = Uri.https(baseUrlOfTasks, 'vdev/tasks-challenge/tasks/$id', params);

    final response = await http.get(formatUrl,headers: headers);

    Task task = Task.fromJson(jsonDecode(response.body)[0]);

    return task;
  } 

}
