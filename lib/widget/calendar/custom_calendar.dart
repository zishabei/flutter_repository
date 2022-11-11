import 'package:flutter/material.dart';
import 'package:flutter_project/widget/app_appbar.dart';
import 'package:flutter_project/widget/app_scaffold.dart';
import 'package:flutter_project/widget/calendar/ui/calendar_view.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    Key? key,
  }) : super(key: key);

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const CustomCalendar();
    });
  }

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: AppAppBar(
          context: context,
          title: const Text(
            "calendar",
          ),
        ),
        body: const CalendarPage());
  }
}
