import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_app_prueba/app/ui/utils/utilits.dart';

class DeleteTasksService extends GetConnect {

  deleteTaskById(int id) async {
    Uri formatUrl = Uri.https(baseUrlOfTasks, 'vdev/tasks-challenge/tasks/$id');

    headers['Content-Type'] = 'application/x-www-form-urlencoded';
    final response = await http.delete(
      formatUrl,
      headers: headers,
      body: params
    );
  } 

}
