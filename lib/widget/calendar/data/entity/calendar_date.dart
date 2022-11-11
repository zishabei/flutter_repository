import 'package:flutter_project/widget/calendar/data/entity/day.dart';
import 'package:flutter_project/widget/calendar/data/entity/day_of_week.dart';
import 'package:flutter_project/widget/calendar/data/entity/month.dart';
import 'package:flutter_project/widget/calendar/data/entity/year.dart';
import 'package:flutter/foundation.dart';

/// カレンダーの日付を表すクラス
class CalendarDate {
  CalendarDate({
    @required Year? year,
    @required Month? month,
    @required Day? day,
    @required DayOfWeek? dayOfWeek,
    bool enabled = true,
  })  : year = year,
        month = month,
        day = day,
        dayOfWeek = dayOfWeek,
        enabled = enabled;

  final Year? year;
  final Month? month;
  final Day? day;
  final DayOfWeek? dayOfWeek;
  final bool enabled;
}
