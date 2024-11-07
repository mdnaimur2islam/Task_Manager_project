class task_status {
  String? id;
  int? sum;

  task_status({this.id, this.sum});

  task_status.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    sum = json["sum"];
  }


}