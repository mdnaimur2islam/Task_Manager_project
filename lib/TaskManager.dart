

import 'package:flutter/material.dart';
import 'package:taskmanager/Utils/app_colors.dart';
import 'package:taskmanager/screens/splash_screens.dart';

class TaskManager extends StatefulWidget {
  const TaskManager({super.key});
  static GlobalKey<NavigatorState> navigatorKey=GlobalKey<NavigatorState>();

  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      navigatorKey: TaskManager.navigatorKey,
      theme: ThemeData(
        textTheme: const TextTheme(),
        inputDecorationTheme: _inputDecorationTheme(),
        elevatedButtonTheme:_elevatedButtonThemeData()
      ),
     home :const SplashScreens()
    );
  }

  InputDecorationTheme _inputDecorationTheme(){
    return InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      hintStyle: const TextStyle(
        fontWeight: FontWeight.w100
      ),
      border: _inputBorder(),
      enabledBorder: _inputBorder(),
      errorBorder: _inputBorder(),
      focusedBorder: _inputBorder(),
    );
  }
  OutlineInputBorder _inputBorder(){
    return OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(8)
    );
  }
  ElevatedButtonThemeData _elevatedButtonThemeData(){
    return ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
  backgroundColor: AppColors.ThemeColor,
  foregroundColor: Colors.white,
  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
  fixedSize: const Size.fromWidth(double.maxFinite),
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(8),
  )
  ),
      );
}
}
