import 'package:flutter/material.dart';
import 'package:todoc8/pages/settings-pages/settings_pages.dart';
import 'package:todoc8/pages/tasks-pages/tasks_pages.dart';
import 'package:todoc8/shared/theme/colors.dart';

import '../pages/addtask/addtask.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "home_layout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentSelectedIndex = 0;
  List<Widget> screenLayout = [
    TasksPages(),
    SettingsPages(),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          "To Do List",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      body: screenLayout[currentSelectedIndex],
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          showAddTaskBottomSheet();
        },
        shape: StadiumBorder(
          side: BorderSide(
            color: theme.accentColor,
            width: 4,
          ),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: theme.accentColor,
        notchMargin: 8.0,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          elevation: 0.0,
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
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
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
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: AddTask(),
      ),
    );
  }
}
