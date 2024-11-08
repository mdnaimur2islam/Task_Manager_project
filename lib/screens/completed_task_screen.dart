import 'package:flutter/material.dart';
import 'package:taskmanager/data/Utils/snack_bar_message.dart';
import 'package:taskmanager/data/Utils/uris.dart';
import 'package:taskmanager/data/models/TaskModel.dart';
import 'package:taskmanager/data/models/Task_List_Model.dart';
import 'package:taskmanager/data/models/network_response.dart';
import 'package:taskmanager/data/services/network_caller.dart';
import 'package:taskmanager/widget/TaskCard.dart';

class completed_task_screen extends StatefulWidget {
  const completed_task_screen({super.key});

  @override
  State<completed_task_screen> createState() => _completed_task_screenState();
}

class _completed_task_screenState extends State<completed_task_screen> {
  bool _getCompletedTaskListInProgress=false;
  List<TaskModel>_CompletedTaskList=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCompletedTask();
  }
  @override
  Widget build(BuildContext context) {
    return  Visibility(
      visible: !_getCompletedTaskListInProgress,
      replacement: RefreshIndicator(
          onRefresh:() async{
            _getCompletedTask();
          },
            
              child: CircularProgressIndicator(),
            
        ),

      child: ListView.separated(
        itemBuilder: (context, index) {
          return  TaskCard(
            taskModel: _CompletedTaskList[index],
            onRefreshList: _getCompletedTask,
          );
        },
        itemCount: _CompletedTaskList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8);
        },
      ),
    );
  }
  Future<void> _getCompletedTask() async{
    _CompletedTaskList.clear();
    _getCompletedTaskListInProgress=true;
    setState(() {});
    final network_response response=await network_caller.getRequest(url:uris.CompletedTaskList);
    if(response.isSuccess){
      final Task_List_Model task_list_model=Task_List_Model.fromJson(response.responseData);
      _CompletedTaskList=task_list_model.taskList ??[];
    }
    else{
      snack_bar_message(context, response.errorMessage,true);
    }
    _getCompletedTaskListInProgress=false;
    setState(() {});
  }
}
