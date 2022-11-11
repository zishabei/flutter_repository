import 'package:flutter/material.dart';

/// 曜日を表示するWidget
class CalendarDayOfWeekCell extends StatelessWidget {
  const CalendarDayOfWeekCell({
    Key? key,
    required this.dayOfWeek,
  }) : super(key: key);

  final String? dayOfWeek;

  @override
  Widget build(Object context) {
    return Expanded(
      child: SizedBox(
        height: 24.0,
        child: Center(
          child: Text(
            dayOfWeek!,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
