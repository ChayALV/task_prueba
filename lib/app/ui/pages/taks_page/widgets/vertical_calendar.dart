
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:task_app_prueba/app/controllers/task_controller.dart';

class VerticalCalendar extends StatelessWidget {
  final TaskController controller;
  const VerticalCalendar({
    Key? key, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: DatePicker(
        controller.task!.dueDate == '0000-00-00' ? DateTime.now():DateTime.parse(controller.task!.dueDate),
        initialSelectedDate:controller.task!.dueDate == '0000-00-00' ? DateTime.now():DateTime.parse(controller.task!.dueDate),
        selectionColor: Colors.indigo.shade300,
        selectedTextColor: Colors.white,
        deactivatedColor: Colors.white,
        locale: 'es_MX',
      ),
    );
  }
}
