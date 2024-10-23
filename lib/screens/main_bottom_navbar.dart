import 'package:flutter/material.dart';
import 'package:taskmanager/screens/cancelled_task_screen.dart';
import 'package:taskmanager/screens/completed_task_screen.dart';
import 'package:taskmanager/screens/new_task_screen.dart';
import 'package:taskmanager/screens/progress_task_screen.dart';
import 'package:taskmanager/widget/TMAppBar.dart';

class main_bottom_navbar extends StatefulWidget {
  const main_bottom_navbar({super.key});

  @override
  State<main_bottom_navbar> createState() => _main_bottom_navbarState();
}

class _main_bottom_navbarState extends State<main_bottom_navbar> {
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    new_task_screen(),
    completed_task_screen(),
    cancelled_task_screen(),
    progress_task_screen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          _selectedIndex = index;
          setState(() {});
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.new_label), label: 'New'),
          NavigationDestination(
              icon: Icon(Icons.check_box), label: 'completed'),
          NavigationDestination(icon: Icon(Icons.close), label: 'canceled'),
          NavigationDestination(
              icon: Icon(Icons.access_time_outlined), label: 'progress')
        ],
      ),
    );
  }
}
