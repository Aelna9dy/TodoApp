import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';
import 'package:todo_app/Shared_Components/color.dart';
import 'package:todo_app/Ui/Task/task_design.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    var mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        TimelineCalendar(
          calendarType: CalendarType.GREGORIAN,
          calendarLanguage: "en",
          calendarOptions: CalendarOptions(
            viewType: ViewType.DAILY,
            toggleViewType: true,
            headerMonthElevation: 10,
            headerMonthShadowColor: Colors.black26,
            headerMonthBackColor: Colors.transparent,
          ),
          dayOptions: DayOptions(
              compactMode: true,
              weekDaySelectedColor: primaryColor,
              disableDaysBeforeNow: true),
          headerOptions: HeaderOptions(
              weekDayStringType: WeekDayStringTypes.SHORT,
              monthStringType: MonthStringTypes.FULL,
              backgroundColor: primaryColor,
              headerTextColor: Colors.black),
          onChangeDateTime: (datetime) {
            print(datetime.getDate());
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => const DesignTasks(),
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
