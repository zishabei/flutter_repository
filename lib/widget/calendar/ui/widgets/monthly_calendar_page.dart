import 'package:flutter_project/widget/calendar/data/entity/calendar_week.dart';
import 'package:flutter_project/widget/calendar/ui/widgets/calendar_day_of_week.dart';
import 'package:flutter_project/widget/calendar/ui/widgets/week_row.dart';
import 'package:flutter/material.dart';

/// 月ごとのカレンダーのWidget
class MonthlyCalendarPage extends StatelessWidget {
  MonthlyCalendarPage({
    @required this.calendarMonthDate,
  });

  final List<CalendarWeek>? calendarMonthDate;

  static const FIRST_WEEK = 0;
  static const SECOND_WEEK = 1;
  static const THIRD_WEEK = 2;
  static const FORTH_WEEK = 3;
  static const FIFTH_WEEK = 4;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CalendarDayOfWeek(),
          WeekRow(
            calendarWeek: calendarMonthDate![FIRST_WEEK],
          ),
          WeekRow(
            calendarWeek: calendarMonthDate![SECOND_WEEK],
          ),
          WeekRow(
            calendarWeek: calendarMonthDate![THIRD_WEEK],
          ),
          WeekRow(
            calendarWeek: calendarMonthDate![FORTH_WEEK],
          ),
          WeekRow(
            calendarWeek: calendarMonthDate![FIFTH_WEEK],
          ),
        ],
      ),
    );
  }
}
