import 'package:flutter/material.dart';
import 'package:taskmanager/Utils/app_colors.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildSummarySection(),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return const TaskCard();
              },
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8);
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddIcon,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSummarySection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            TaskSummaryCard(title: 'New', count: 09),
            TaskSummaryCard(title: 'Completed', count: 09),
            TaskSummaryCard(title: 'Cancelled', count: 09),
            TaskSummaryCard(title: 'progress', count: 09),
          ],
        ),
      ),
    );
  }

  void _onTapAddIcon() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const add_new_task_screen(),
      ),
    );
  }
}

