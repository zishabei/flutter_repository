/// 月を表す列挙型
enum Month {
  January,
  February,
  March,
  April,
  May,
  June,
  July,
  August,
  September,
  October,
  November,
  December,
}

extension MonthExtensions on Month {
  String asStringValue() => (index + 1).toString();
  int compareTo(Month month) => index.compareTo(month.index);
}
