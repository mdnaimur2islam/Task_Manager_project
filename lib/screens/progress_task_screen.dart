import 'package:flutter/material.dart';
import 'package:taskmanager/data/Utils/snack_bar_message.dart';
import 'package:taskmanager/data/Utils/uris.dart';
import 'package:taskmanager/data/models/TaskModel.dart';
import 'package:taskmanager/data/models/Task_List_Model.dart';
import 'package:taskmanager/data/models/network_response.dart';
import 'package:taskmanager/data/services/network_caller.dart';
import 'package:taskmanager/widget/TaskCard.dart';

class progress_task_screen extends StatefulWidget {
  const progress_task_screen({super.key});

  @override
  State<progress_task_screen> createState() => _progress_task_screenState();
}

class _progress_task_screenState extends State<progress_task_screen> {
  bool _getProgressTaskListInProgress=false;
  List<TaskModel>_progressTaskList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProgressTask();
  }
  @override
  Widget build(BuildContext context) {
    return  Visibility(
      visible: !_getProgressTaskListInProgress,
      replacement: RefreshIndicator(
            onRefresh:() async{
              _getProgressTask();
            },
            child: CircularProgressIndicator()
      ),

      child: ListView.separated(
        itemBuilder: (context, index) {
          return  TaskCard(
            taskModel: _progressTaskList[index],
            onRefreshList: _getProgressTask,
          );
        },
        itemCount: _progressTaskList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8);
        },
      ),
    );
  }
  Future<void> _getProgressTask() async{
    _progressTaskList.clear();
   _getProgressTaskListInProgress=true;
    setState(() {});
    final network_response response=await network_caller.getRequest(url:uris.CancelledTaskList);
    if(response.isSuccess){
      final Task_List_Model task_list_model=Task_List_Model.fromJson(response.responseData);
      _progressTaskList=task_list_model.taskList ??[];
    }
    else{
      snack_bar_message(context, response.errorMessage,true);
    }
    _getProgressTaskListInProgress=false;
    setState(() {});
  }
}
