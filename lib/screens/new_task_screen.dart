import 'package:flutter/material.dart';
import 'package:taskmanager/Utils/app_colors.dart';
import 'package:taskmanager/data/Utils/snack_bar_message.dart';
import 'package:taskmanager/data/Utils/uris.dart';
import 'package:taskmanager/data/models/TaskModel.dart';
import 'package:taskmanager/data/models/Task_List_Model.dart';
import 'package:taskmanager/data/models/network_response.dart';
import 'package:taskmanager/data/models/task_status.dart';
import 'package:taskmanager/data/models/task_status_count.dart';
import 'package:taskmanager/data/services/network_caller.dart';
import 'package:taskmanager/screens/add_new_task_screen.dart';
import 'package:taskmanager/screens/new_task_screen.dart';
import 'package:taskmanager/widget/TaskCard.dart';
import 'package:taskmanager/widget/TaskSummaryCard.dart';

class new_task_screen extends StatefulWidget {
  const new_task_screen({super.key});

  @override
  State<new_task_screen> createState() => _new_task_screenState();
}

class _new_task_screenState extends State<new_task_screen> {
  bool _getNewTaskInProgress=false;
  bool _getTaskStatusCountInProgress=false;
  List<TaskModel>_newTaskList=[];
  List<task_status>_taskStatusCountList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getNewTask();
    _getTaskStatusCount();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
          _getNewTask();
          _getTaskStatusCount();
      },
        child: Column(
          children: [
            _buildSummarySection(),
            Expanded(
              child: Visibility(
                visible: !_getNewTaskInProgress,
                replacement: const CircularProgressIndicator(),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                   return  TaskCard(taskModel: _newTaskList[index],
                     onRefreshList: _getTaskStatusCount
                   );
                  },
                  itemCount: _newTaskList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 8);
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddFABIcon,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSummarySection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Visibility(
        visible: _getTaskStatusCountInProgress==false,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _getTaskSummaryCardList(),
          ),
        ),
      ),
    );
  }
 List<TaskSummaryCard>_getTaskSummaryCardList(){
    List<TaskSummaryCard> taskSummaryCardList=[];
    for(task_status t in _taskStatusCountList){
      taskSummaryCardList.add(TaskSummaryCard(title: t.id!, count: t.sum!));
    }
    return taskSummaryCardList;
 }
  Future<void> _onTapAddFABIcon() async {

    final bool? shouldRefresh=await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const add_new_task_screen(),
      ),
    );
    if(shouldRefresh==true){
      _getTaskStatusCount();
    }
  }
  Future<void> _getTaskStatusCount() async{
    _taskStatusCountList.clear();
    _getTaskStatusCountInProgress=true;
    setState(() {});
    final network_response response=await network_caller.getRequest(url: uris.taskStatusCount);
    if(response.isSuccess){
      final Task_status_count taskcount=Task_status_count.fromJson(response.responseData);
      _taskStatusCountList=taskcount.task_status_count_list ?? [];
    }
    else{
      snack_bar_message(context, response.errorMessage,true);
    }
    _getTaskStatusCountInProgress=false;
    setState(() {});
  }
  Future<void> _getNewTask() async{
    _newTaskList.clear();
    _getNewTaskInProgress=true;
    setState(() {});
    final network_response response=await network_caller.getRequest(url: uris.newTaskList);
    if(response.isSuccess){
      final Task_List_Model task_list_model=Task_List_Model.fromJson(response.responseData);
      _newTaskList=task_list_model.taskList ??[];
    }
    else{
      snack_bar_message(context, response.errorMessage,true);
    }
    _getNewTaskInProgress=false;
    setState(() {});
  }

}

