import 'package:flutter_project/widget/calendar/ui/calendar_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// カレンダーのヘッダー部分のWidget
class CalendarPageHeader extends HookConsumerWidget {
  const CalendarPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(calendarViewModelProvider);

    return Container(
      padding: const EdgeInsets.only(
        top: 44.0,
        bottom: 0.0,
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: Text(
              viewModel.nextMonthLabel,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              viewModel.monthLabel,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            right: 0,
            child: Text(
              viewModel.nextMonthLabel,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
