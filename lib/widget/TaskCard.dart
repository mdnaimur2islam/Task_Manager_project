import 'package:flutter/material.dart';
import 'package:taskmanager/Utils/app_colors.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
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
              'Title of the task',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium,
            ),
            const Text('Description of task'),
            const Text('Date 23-03-2001'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTaskStatusChip(),
                Wrap(
                  children: [
                    IconButton(onPressed: _onTapEditButton,
                        icon: const Icon(Icons.edit)
                    ),
                    IconButton(onPressed: _onTapDeleteButton,
                        icon: const Icon(Icons.delete)
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

              },
                title: Text('')
            );
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
  void _onTapDeleteButton(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Delete Status'),
        actions: [
          TextButton(onPressed: (){}, child: const Text('cancel')),
          TextButton(onPressed: (){}, child: const Text('Okay')),

        ],
      );
    }
    );
  }

  Widget _buildTaskStatusChip() {
    return Chip(
                label: Text(
                  'New',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                side:
                const BorderSide(color: AppColors.ThemeColor),
              );
  }
}
