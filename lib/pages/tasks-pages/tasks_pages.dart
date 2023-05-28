import 'package:flutter/material.dart';
import 'package:todoc8/pages/tasks-pages/task_items.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

import '../../shared/theme/colors.dart';

class TasksPages extends StatefulWidget {
  @override
  State<TasksPages> createState() => _TasksPagesState();
}

class _TasksPagesState extends State<TasksPages> {
  DateTime _selectedDay = DateTime.now().add(const Duration(days: 365));

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        WeeklyDatePicker(
          weeknumberColor: theme.accentColor,
          selectedDigitColor: Colors.white,
          selectedDay: _selectedDay,
          changeDay: (value) => setState(() {
            _selectedDay = value;
          }),
          enableWeeknumberText: false,
          weeknumberTextColor: theme.accentColor,
          backgroundColor: theme.accentColor,
          weekdayTextColor: Colors.grey,
          digitsColor: Colors.grey,
          selectedBackgroundColor: primaryColor,
          weekdays: const ["str", "sun", "Mon", "Tu", "We", "Th", "Fr"],
          daysInWeek: 7,
        ),
        // CalendarTimeline(
        //   shrink: true,
        //   showYears: true,
        //   initialDate: DateTime.now(),
        //   firstDate: DateTime.now().subtract(const Duration(days: 365)),
        //   lastDate: DateTime.now().add(const Duration(days: 1460)),
        //   onDateSelected: (date) => print(date),
        //   leftMargin: 20,
        //   monthColor: Colors.black,
        //   dayColor: Colors.black,
        //   activeDayColor: primaryColor,
        //   activeBackgroundDayColor: Colors.white,
        //   locale: 'en_ISO',
        // ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return const TaskItems();
            },
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
