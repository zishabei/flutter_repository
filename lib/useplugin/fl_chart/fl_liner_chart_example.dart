import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/widget/app_debug.dart';
import 'package:intl/intl.dart';

/// !!Step1: prepare the data to plot.
final _data1 = <double, double>{
  1: 22,
  2: 25,
  3: 20,
  4: 28,
  5: 34,
  6: 50,
  7: 40
};
final _data2 = <double, double>{
  1: 34,
  2: 25,
  3: 27,
  4: 31,
  5: 36,
  6: 45,
  7: 40
};

class FlLineChartExample extends StatefulWidget {
  const FlLineChartExample({super.key});

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const FlLineChartExample();
    });
  }

  @override
  _FlLineChartExampleState createState() => _FlLineChartExampleState();
}

class _FlLineChartExampleState extends State<FlLineChartExample> {
  @override
  Widget build(BuildContext context) {
    /// !!Step2: convert data into a list of [FlSpot].
    final spots1 = <FlSpot>[
      for (final entry in _data1.entries) FlSpot(entry.key, entry.value)
    ];
    final spots2 = <FlSpot>[
      for (final entry in _data2.entries) FlSpot(entry.key, entry.value)
    ];

    /// !!Step3: prepare LineChartData
    /// !here we can set styles and behavior of the chart.
    final lineChartData = LineChartData(
      maxY: 60,
      minY: 20,
      maxX: 7,
      // The data to show.
      lineBarsData: [
        // ! Here we can style each data line.
        LineChartBarData(
          spots: spots1,
          color: const Color(0xffFD8D19),
          barWidth: 2,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) =>
                FlDotCirclePainter(
              radius: 2,
              color: Colors.white,
              strokeWidth: 2,
              strokeColor: const Color(0xffFD8D19),
            ),
          ),
        ),
        LineChartBarData(
          spots: spots2,
          color: const Color(0xffF14040),
          barWidth: 2,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) =>
                FlDotCirclePainter(
                    radius: 2,
                    color: Colors.white,
                    strokeWidth: 2,
                    strokeColor: const Color(0xffF14040)),
          ),
        ),
      ],
      // ! Behavior when touching the chart:
      lineTouchData: const LineTouchData(handleBuiltInTouches: false),
      // ! Borders:
      borderData: FlBorderData(
          show: true, border: Border.all(color: const Color(0xFFA5A5A5))),
      // ! Grid behavior:
      gridData: FlGridData(
        show: true,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) => const FlLine(
          color: Color(0xFFA5A5A5),
          dashArray: [2, 2],
          strokeWidth: 1,
        ),
        // horizontalInterval: chartY / 4,
        // verticalInterval: 1 / 7,
        getDrawingVerticalLine: (value) => const FlLine(
          color: Color(0xFFA5A5A5),
          dashArray: [2, 2],
          strokeWidth: 1,
        ),
      ),
      // ! Title and ticks in the axis
      titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: getTitles,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              // ! Decides how to show left titles,
              // here we skip some values by returning ''.
              getTitlesWidget: (double val, _) {
                if (val.toInt() % 5 != 0) return Text('');
                return Text('${val.toInt()}');
              },
            ),
          ),
          rightTitles: const AxisTitles(),
          topTitles: const AxisTitles()),
      extraLinesData: ExtraLinesData(
        horizontalLines: [
          HorizontalLine(
            y: 45,
            color: Colors.pinkAccent,
            strokeWidth: 3,
            label: HorizontalLineLabel(
              show: true,
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(right: 5, bottom: 5),
              style: const TextStyle(color: Colors.black, fontSize: 14),
              labelResolver: (line) => '目標体重',
            ),
          ),
        ],
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text('FlLineChartExample'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(28),
          child: AspectRatio(aspectRatio: 1.5, child: LineChart(lineChartData)),
        ));
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(color: Colors.black, fontSize: 11);
    AppDebug.log("value:$value");
    final now = DateTime.now();
    Widget text;
    switch (value.toInt()) {
      case 1:
        final title = DateFormat("d(E)", "ja")
            .format(now.subtract(const Duration(days: 6)));
        text = Text(title, style: style);
        break;
      case 2:
        final title = DateFormat("d(E)", "ja")
            .format(now.subtract(const Duration(days: 5)));
        text = Text(title, style: style);
        break;
      case 3:
        final title = DateFormat("d(E)", "ja")
            .format(now.subtract(const Duration(days: 4)));
        text = Text(title, style: style);
        break;
      case 4:
        final title = DateFormat("d(E)", "ja")
            .format(now.subtract(const Duration(days: 3)));
        text = Text(title, style: style);
        break;
      case 5:
        final title = DateFormat("d(E)", "ja")
            .format(now.subtract(const Duration(days: 2)));
        text = Text(title, style: style);
        break;
      case 6:
        final title = DateFormat("d(E)", "ja")
            .format(now.subtract(const Duration(days: 1)));
        text = Text(title, style: style);
        break;
      case 7:
        final title = DateFormat("d(E)", "ja").format(now);
        text = Text(title, style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    // return text;
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2,
      child: text,
    );
  }
}
