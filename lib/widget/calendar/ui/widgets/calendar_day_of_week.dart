import 'package:flutter_project/widget/calendar/ui/calendar_view_model.dart';
import 'package:flutter_project/widget/calendar/ui/widgets/calendar_day_of_week_cell.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 曜日の列を表示するWidget
class CalendarDayOfWeek extends HookConsumerWidget {
  const CalendarDayOfWeek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(calendarViewModelProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        CalendarDayOfWeekCell(
          dayOfWeek: viewModel.weekday[0],
        ),
        CalendarDayOfWeekCell(
          dayOfWeek: viewModel.weekday[1],
        ),
        CalendarDayOfWeekCell(
          dayOfWeek: viewModel.weekday[2],
        ),
        CalendarDayOfWeekCell(
          dayOfWeek: viewModel.weekday[3],
        ),
        CalendarDayOfWeekCell(
          dayOfWeek: viewModel.weekday[4],
        ),
        CalendarDayOfWeekCell(
          dayOfWeek: viewModel.weekday[5],
        ),
        CalendarDayOfWeekCell(
          dayOfWeek: viewModel.weekday[6],
        ),
      ],
    );
  }
}
