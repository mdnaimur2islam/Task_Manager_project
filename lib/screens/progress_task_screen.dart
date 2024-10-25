import 'package:flutter/material.dart';
import 'package:taskmanager/widget/TaskCard.dart';

class progress_task_screen extends StatelessWidget {
  const progress_task_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      itemBuilder: (context, index) {
        return const TaskCard();
      },
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8);
      },
    );
  }
}
