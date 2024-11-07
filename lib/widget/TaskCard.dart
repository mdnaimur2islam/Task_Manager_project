import 'package:flutter/material.dart';
import 'package:taskmanager/Utils/app_colors.dart';
import 'package:taskmanager/data/Utils/snack_bar_message.dart';
import 'package:taskmanager/data/Utils/uris.dart';
import 'package:taskmanager/data/models/TaskModel.dart';
import 'package:taskmanager/data/models/network_response.dart';
import 'package:taskmanager/data/services/network_caller.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key, required this.taskModel, required this.onRefreshList,
  });
final TaskModel taskModel;
final VoidCallback onRefreshList;
  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  String _selectedStatus = '';
  bool _changeStatusInProgress = false;
  bool _deleteTaskInProgress = false;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.taskModel.status!;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.taskModel.title??'',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium,
            ),
             Text(widget.taskModel.description??''),
             Text('Date ${widget.taskModel.createdDate?? ''}'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTaskStatusChip(),
                Wrap(
                  children: [
                    Visibility(
                      visible: _changeStatusInProgress==false,
                      replacement: Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: IconButton(onPressed: _onTapEditButton,
                          icon: const Icon(Icons.edit)
                      ),
                    ),
                    Visibility(
                      visible: _deleteTaskInProgress==false,
                      replacement: Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: IconButton(onPressed: _onTapDeleteButton,
                          icon: const Icon(Icons.delete)
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onTapEditButton(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Edit Status'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            'New','Completed','Cancelled','Progress'
          ].map((e){
            return ListTile(
              onTap: (){
                _changeStatus(e);
                Navigator.pop(context);
              },
                title: Text(e),
              selected: _selectedStatus==e,
              trailing: _selectedStatus == e ? const Icon(Icons.check) : null,            );
          }).toList(),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          },
              child: const Text('cancel')
          ),
          TextButton(onPressed: (){}, child: const Text('Okay')),

        ],
      );
    }
    );
  }
  void _onTapDeleteButton() async{

    _deleteTaskInProgress = true;
    setState(() {});
    final network_response response = await network_caller.getRequest(
        url: uris.deleteTask(widget.taskModel.sId!));
    if (response.isSuccess) {
      widget.onRefreshList();
    } else {
      _deleteTaskInProgress = false;
      setState(() {});
      snack_bar_message(context, response.errorMessage);
    }
  }

  Widget _buildTaskStatusChip() {
    return Chip(
                label: Text(
                  widget.taskModel.status!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                side:
                const BorderSide(color: AppColors.ThemeColor),
              );
  }
  Future<void> _changeStatus(String newStatus) async {
    _changeStatusInProgress = true;
    setState(() {});
    final network_response response = await network_caller.getRequest(
        url: uris.changeStatus(widget.taskModel.sId!, newStatus));
    if (response.isSuccess) {
      widget.onRefreshList();
    } else {
      _changeStatusInProgress = false;
      setState(() {});
      snack_bar_message(context, response.errorMessage);
    }
  }

}
