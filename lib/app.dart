

import 'package:flutter/material.dart';
import 'package:taskmanager/screens/splash_screens.dart';

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     home : SplashScreens()
    );
  }
}
