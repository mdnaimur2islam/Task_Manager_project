import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:taskmanager/data/Utils/snack_bar_message.dart';
import 'package:taskmanager/data/Utils/uris.dart';
import 'package:taskmanager/data/models/network_response.dart';
import 'package:taskmanager/data/services/network_caller.dart';
import 'package:taskmanager/widget/TMAppBar.dart';

class add_new_task_screen extends StatefulWidget {
  const add_new_task_screen({super.key});

  @override
  State<add_new_task_screen> createState() => _add_new_task_screenState();
}

class _add_new_task_screenState extends State<add_new_task_screen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptonTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _addNewTaskInprogress = false;
  bool _shouldRefreshPreviouPage=false;

  @override
  Widget build(BuildContext context) {
    return PopScope(

     //onPopInvokedWithResult: not work

      child: Scaffold(
        appBar: TMAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 42),
                  Text('Add new Task',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _titleTEController,
                    decoration: const InputDecoration(hintText: 'Title'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'enter title';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _descriptonTEController,
                    maxLines: 5,
                    decoration: const InputDecoration(hintText: 'Description'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'enter title';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Visibility(
                    visible: !_addNewTaskInprogress,
                    replacement: const CircularProgressIndicator(),
                    child: ElevatedButton(
                        onPressed: _onTapSubmitButton,
                        child: const Icon(Icons.arrow_circle_right_outlined)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSubmitButton() {
    if (_formKey.currentState!.validate()) {
      _addNewTask();
    }
  }

  Future<void> _addNewTask() async {
    _addNewTaskInprogress = true;
    setState(() {});
    Map<String, dynamic> requestBody = {
      'title': _titleTEController.text.trim(),
      'description': _descriptonTEController.text.trim(),
      'status': 'New',
    };
    final network_response response = await network_caller.postRequest(
        url: uris.addNewTask, body: requestBody);

    _addNewTaskInprogress = false;
    setState(() {});

    if (response.isSuccess) {
      _shouldRefreshPreviouPage=true;
      _clearTextFields();
      snack_bar_message(context, 'Uploaded task');
    } else {
      snack_bar_message(context, response.errorMessage, true);
    }
  }

  void _clearTextFields() {
    _titleTEController.clear();
    _descriptonTEController.clear();
  }
  void dispose(){
    super.dispose();
    _titleTEController.clear();
    _descriptonTEController.clear();
  }
}
