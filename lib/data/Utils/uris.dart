class uris{
  static const String _baseUrl='http://35.73.30.144:2005/api/v1';
  static const String registration = '$_baseUrl/Registration';
  static const String login = '$_baseUrl/Login';
  static const String addNewTask = '$_baseUrl/createTask';
  static const String newTaskList = '$_baseUrl/listTaskByStatus/New';
  static const String CompletedTaskList = '$_baseUrl/listTaskByStatus/Completed';
  static const String CancelledTaskList = '$_baseUrl/listTaskByStatus/Cancelled';
  static const String taskStatusCount = '$_baseUrl/taskStatusCount';
  static const String ProfileUpdate = '$_baseUrl/ProfileUpdate';
  static const String recoveryEmail = '$_baseUrl/RecoverVerifyEmail/email@gmail.com';
  static String changeStatus(String taskId,String status)=>
      '$_baseUrl/updateTaskStatus/$taskId/$status';
  static String deleteTask(String taskId)=>
      '$_baseUrl/deleteTask/$taskId';
}