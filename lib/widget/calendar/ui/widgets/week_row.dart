import 'package:flutter_project/widget/calendar/data/entity/calendar_week.dart';
import 'package:flutter_project/widget/calendar/ui/widgets/date_cell.dart';
import 'package:flutter/material.dart';

/// カレンダーの週を表すWidget
class WeekRow extends StatelessWidget {
  WeekRow({
    @required CalendarWeek? calendarWeek,
  }) : calendarWeek = calendarWeek;
  final CalendarWeek? calendarWeek;

  // Mapで持たせた方が楽かも
  static const int SUNDAY = 0;
  static const int MONDAY = 1;
  static const int TUESDAY = 2;
  static const int WEDNESDAY = 3;
  static const int THURSDAY = 4;
  static const int FRIDAY = 5;
  static const int SATURDAY = 6;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // NoPaddingDivider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            DateCell(
              calendarDate: calendarWeek!.days![SUNDAY],
            ),
            DateCell(
              calendarDate: calendarWeek!.days![MONDAY],
            ),
            DateCell(
              calendarDate: calendarWeek!.days![TUESDAY],
            ),
            DateCell(
              calendarDate: calendarWeek!.days![WEDNESDAY],
            ),
            DateCell(
              calendarDate: calendarWeek!.days![THURSDAY],
            ),
            DateCell(
              calendarDate: calendarWeek!.days![FRIDAY],
            ),
            DateCell(
              calendarDate: calendarWeek!.days![SATURDAY],
            ),
          ],
        ),
      ],
    );
  }
}
