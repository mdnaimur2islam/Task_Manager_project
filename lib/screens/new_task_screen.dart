import 'package:flutter/material.dart';
import 'package:taskmanager/screens/add_new_task_screen.dart';

class new_task_screen extends StatefulWidget {
  const new_task_screen({super.key});

  @override
  State<new_task_screen> createState() => _new_task_screenState();
}

class _new_task_screenState extends State<new_task_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddIcon,
        child: const Icon(Icons.add),
      ),
    );
  }
  void _onTapAddIcon(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const add_new_task_screen(),
    ),
    );
  }
}
