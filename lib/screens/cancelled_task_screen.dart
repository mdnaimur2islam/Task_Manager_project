import 'package:flutter/material.dart';
import 'package:taskmanager/data/Utils/snack_bar_message.dart';
import 'package:taskmanager/data/Utils/uris.dart';
import 'package:taskmanager/data/models/TaskModel.dart';
import 'package:taskmanager/data/models/Task_List_Model.dart';
import 'package:taskmanager/data/models/network_response.dart';
import 'package:taskmanager/data/services/network_caller.dart';
import 'package:taskmanager/widget/TaskCard.dart';

class cancelled_task_screen extends StatefulWidget {
  const cancelled_task_screen({super.key});

  @override
  State<cancelled_task_screen> createState() => _cancelled_task_screenState();
}

class _cancelled_task_screenState extends State<cancelled_task_screen> {
  bool _getCancelledTaskListInProgress=false;
  List<TaskModel>_cancelledTaskList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCancelledTask();
  }
  @override
  Widget build(BuildContext context) {
    return   Visibility(
      visible: !_getCancelledTaskListInProgress,
      replacement: RefreshIndicator(
          onRefresh:() async{
            _getCancelledTask();
          },
          child: CircularProgressIndicator()),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return  TaskCard(
            taskModel: _cancelledTaskList[index],
            onRefreshList: _getCancelledTask,
          );
        },
        itemCount: _cancelledTaskList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8);
        },
      ),
    );
  }
  Future<void> _getCancelledTask() async{
    _cancelledTaskList.clear();
    _getCancelledTaskListInProgress=true;
    setState(() {});
    final network_response response=await network_caller.getRequest(url:uris.CancelledTaskList);
    if(response.isSuccess){
      final Task_List_Model task_list_model=Task_List_Model.fromJson(response.responseData);
      _cancelledTaskList=task_list_model.taskList ??[];
    }
    else{
      snack_bar_message(context, response.errorMessage,true);
    }
    _getCancelledTaskListInProgress=false;
    setState(() {});
  }
}
