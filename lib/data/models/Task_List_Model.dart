import 'package:taskmanager/data/models/TaskModel.dart';
class Task_List_Model {
  String? status;
  List<TaskModel>? taskList;

  Task_List_Model({this.status, this.taskList});

  Task_List_Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      taskList = <TaskModel>[];
      json['data'].forEach((v) {
        taskList!.add(new TaskModel.fromJson(v));
      });
    }
  }


}


