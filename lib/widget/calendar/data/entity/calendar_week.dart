import 'package:flutter_project/widget/calendar/data/entity/calendar_date.dart';
import 'package:flutter/foundation.dart';

/// カレンダーの週を表すデータ構造
class CalendarWeek {
  CalendarWeek({
    @required List<CalendarDate>? days,
  }) : days = days;

  final List<CalendarDate>? days;
}
