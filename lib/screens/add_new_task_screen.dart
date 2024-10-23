import 'package:flutter/material.dart';
import 'package:taskmanager/widget/TMAppBar.dart';

class add_new_task_screen extends StatefulWidget {
  const add_new_task_screen({super.key});

  @override
  State<add_new_task_screen> createState() => _add_new_task_screenState();
}

class _add_new_task_screenState extends State<add_new_task_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 42),
              Text('Add new Task' ,style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500)
              ),
              const SizedBox(height: 24),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Title'
                ),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Description'
                ),
              ),
              const SizedBox(height: 16,),
              ElevatedButton(onPressed: (){},
                  child: const Icon(Icons.arrow_circle_right_outlined)
              )
            ],
          ),
        ),
      ),
    );
  }
}
