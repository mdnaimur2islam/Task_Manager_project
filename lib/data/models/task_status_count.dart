


import 'package:taskmanager/data/models/task_status.dart';
import 'package:taskmanager/data/models/task_status_count.dart';

class Task_status_count {
  String? status;
  List<task_status>? task_status_count_list;

  Task_status_count({this.status, this.task_status_count_list});

  Task_status_count.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    task_status_count_list = json["data"] == null ? null : (json["data"] as List).map((e) => task_status.fromJson(e)).toList();
  }


}


