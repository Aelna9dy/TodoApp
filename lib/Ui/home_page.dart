import 'package:flutter/material.dart';
import 'package:todo_app/Shared_Components/color.dart';
import 'package:todo_app/Ui/Settings/settings.dart';
import 'package:todo_app/Ui/Task/task_page.dart';
import 'package:todo_app/Ui/TaskAdd/task_add.dart';

class HomePage extends StatefulWidget {
  static const String routName = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentSelectedIndex = 0;
  List<Widget> Screens = [
    TaskList(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: lightGreenColor,
      appBar: AppBar(
        title: Text(
          "To Do List",
          style: theme.bodyLarge!.copyWith(color: Colors.white),
        ),
      ),
      body: Screens[currentSelectedIndex],
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const StadiumBorder(
            side: BorderSide(
          color: Colors.white,
          width: 5,
        )),
        onPressed: () {
          showAddTaskBottomSheet();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8.0,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          onTap: (int index) {
            setState(() {
              currentSelectedIndex = index;
            });
          },
          currentIndex: currentSelectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                size: 35,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 35,
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => const TaskAdd(),
    );
  }
}
