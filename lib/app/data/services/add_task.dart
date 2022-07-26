import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_app_prueba/app/ui/utils/utilits.dart';

class AddTasksService extends GetConnect {


  Uri formatUrl = Uri.https(baseUrlOfTasks, 'vdev/tasks-challenge/tasks');

  addTask(Map datos) async {

    headers['Content-Type'] = 'application/x-www-form-urlencoded';
    await http.post(
      formatUrl,
      headers: headers,
      body: {
        'token' : token,
        'title' : datos['titulo'] ,
        'is_completed' : '0', 
        'due_date' : datos['fecha'],
        'comments' : datos['cometarios'],
        'description' : datos['descripcion'], 
        'tags' : datos['tags'],
      }
    );
  } 

}
