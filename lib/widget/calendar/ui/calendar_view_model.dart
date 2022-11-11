import 'package:flutter_project/widget/calendar/data/entity/calendar_date.dart';
import 'package:flutter_project/widget/calendar/data/entity/calendar_week.dart';
import 'package:flutter_project/widget/calendar/data/entity/day.dart';
import 'package:flutter_project/widget/calendar/data/entity/day_of_week.dart';
import 'package:flutter_project/widget/calendar/data/entity/month.dart';
import 'package:flutter_project/widget/calendar/data/entity/year.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

final calendarViewModelProvider = ChangeNotifierProvider<CalendarViewModel>(
  (ref) => CalendarViewModel(),
);

class CalendarViewModel extends ChangeNotifier {
  CalendarViewModel() {
    initialize();
  }

  static const PREVIUS_MONTH_OFFSET = -1;
  static const NEXT_MONTH_OFFSET = 1;
  static const NUMBER_OF_ONE_WEEK = 7;
  static const STARTING_ON_SUNDAY = 0;

  /// 初期ページ
  late int _initialPage;

  /// 現在のページ
  late int currentPage;

  late PageController pageController;

  /// 今月
  late DateTime currentMonth;

  /// 目的の月
  late DateTime targetMonth;

  /// 曜日
  List<String> initialWeekday = ['日', '月', '火', '水', '木', '金', '土'];

  /// 目的の月のカレンダーリスト
  List<CalendarWeek> calendarMonthDate = [];

  /// 目的の月の日のカレンダーリスト
  List<CalendarDate> flatCalendarDate = [];

  /// ドロップダウンの値
  String? dropdownValue = '日';

  int offset = STARTING_ON_SUNDAY;

  /// ドロップダウンの値を更新
  void upedateDropDownValue(String newValue) {
    dropdownValue = newValue;
    offset = initialWeekday.indexOf(newValue);
    createCalendarList(offset: offset);
    notifyListeners();
  }

  List<String> get weekday => initialWeekday
      .map((e) => initialWeekday[
          (initialWeekday.indexOf(e) + offset) % initialWeekday.length])
      .toList();

  void initialize() {
    final now = DateTime.now();
    currentMonth = now;
    targetMonth = now;
    final formattedNow = DateFormat('yyyyMM').format(now);
    _initialPage = int.parse(formattedNow);
    pageController = PageController(
      initialPage: _initialPage,
    );
    currentPage = _initialPage;
  }

  /// カレンダーページヘッダー用の月のラベル
  String get monthLabel => '${targetMonth.year}年${targetMonth.month}月';

  String get nextMonthLabel =>
      '${targetMonth.year}年${DateTime(targetMonth.year, targetMonth.month + 1, targetMonth.day).month}月';

  String get lastMonthLabel =>
      '${targetMonth.year}年${DateTime(targetMonth.year, targetMonth.month - 1, targetMonth.day).month}月';

  /// 先月のカレンダーに移動する
  void movePreviousMonth() async {
    currentPage--;
    moveMonth(PREVIUS_MONTH_OFFSET);
    createCalendarList();
  }

  /// 来月のカレンダーに移動する
  void moveNextMonth() async {
    currentPage++;
    moveMonth(NEXT_MONTH_OFFSET);
    createCalendarList();
  }

  /// 月の移動
  void moveMonth(int delta) {
    final year = targetMonth.year;
    final month = targetMonth.month;
    targetMonth = DateTime(year, month + delta);
    notifyListeners();
  }

  /// 今月のカレンダーに移動する
  void moveCurrentMonth() {
    pageController.jumpToPage(_initialPage);
    currentPage = _initialPage;
    targetMonth = currentMonth;
    createCalendarList();
  }

  /// カレンダーリストを作成する
  /// year: 年
  /// month: 月
  /// offset: 開始の日（日曜日スタートがoffset:0で、月曜日からにする場合はoffset:1にする）
  void createCalendarList({int offset = STARTING_ON_SUNDAY}) {
    final prevList = prevPaddingDays(offset);
    final currentList = currentDays();
    final nextList = nextPaddingDays(prevList, currentList);
    flatCalendarDate = [
      ...prevList,
      ...currentList,
      ...nextList,
    ];

    calendarMonthDate = to2Dim(flatCalendarDate, NUMBER_OF_ONE_WEEK);
    notifyListeners();
  }

  /// ２次元リストを作成する
  List<CalendarWeek> to2Dim(list, numOfElems) {
    if (list.isEmpty) {
      return [];
    }
    return [
      CalendarWeek(days: list.take(numOfElems).toList()),
      ...to2Dim(list.skip(numOfElems), numOfElems)
    ];
  }

  // 前月の日を埋めるリストを作成する
  List<CalendarDate> prevPaddingDays(int offset) {
    final year = targetMonth.year;
    final month = targetMonth.month;
    final list = <CalendarDate>[];
    final firstDay = DateTime(year, month).weekday;
    final paddingDayCount = (firstDay + 7 - offset) % 7;
    final prevLastDate = DateTime(year, month, 0).day;
    for (var day = prevLastDate - paddingDayCount + 1;
        day < prevLastDate + 1;
        day++) {
      list.add(CalendarDate(
        year: Year(year),
        month: Month.values[DateTime(year, month - 1).month - 1],
        day: Day(day),
        dayOfWeek:
            DayOfWeek.values[(DateTime(year, month - 1, day).weekday % 7)],
        enabled: false,
      ));
    }
    return list;
  }

  // 今月の日にちリストを作成する
  List<CalendarDate> currentDays() {
    final year = targetMonth.year;
    final month = targetMonth.month;
    final list = <CalendarDate>[];
    final lastDate = DateTime(year, month + 1, 0);
    final currentDayCount = lastDate.day;
    for (var day = 1; day < currentDayCount + 1; day++) {
      list.add(CalendarDate(
        year: Year(year),
        month: Month.values[month - 1],
        day: Day(day),
        dayOfWeek: DayOfWeek.values[(DateTime(year, month, day).weekday % 7)],
        enabled: true,
      ));
    }
    return list;
  }

  // 来月の日を埋めるリストを作成する
  List<CalendarDate> nextPaddingDays(prevList, currentList) {
    final year = targetMonth.year;
    final month = targetMonth.month;
    final list = <CalendarDate>[];
    final paddingDayCount = (42 - (prevList.length + currentList.length)) % 7;
    for (var day = 1; day < paddingDayCount + 1; day++) {
      list.add(CalendarDate(
        year: Year(year),
        month: Month.values[DateTime(year, month + 1).month - 1],
        day: Day(day),
        dayOfWeek:
            DayOfWeek.values[(DateTime(year, month + 1, day).weekday % 7)],
        enabled: false,
      ));
    }
    return list;
  }
}
