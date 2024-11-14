import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/widget/app_debug.dart';
import 'package:intl/intl.dart';

/// !!Step1: prepare the data to plot.
final _data = <double, double>{
  1: 22,
  2: 25,
  3: 20,
  // 4: 28,
  // 5: 34,
  6: 150,
  7: 40
};

class FlLineChartSapporo extends StatefulWidget {
  const FlLineChartSapporo({super.key});

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const FlLineChartSapporo();
    });
  }

  @override
  _FlLineChartSapporoState createState() => _FlLineChartSapporoState();
}

class _FlLineChartSapporoState extends State<FlLineChartSapporo> {
  @override
  Widget build(BuildContext context) {
    List<double> yData = [];
    for (final entry in _data.entries) {
      yData.add(entry.value);
    }
    double maxValue = yData.reduce((a, b) => a > b ? a : b);
    double minValue = yData.reduce((a, b) => a < b ? a : b);
    double yMax = (maxValue / 3).roundToDouble() * 3 + 3;
    double yMin = (minValue / 3).roundToDouble() * 3 - 3;
    double yInterval = (yMax - yMin) / 3;

    /// !!Step2: convert data into a list of [FlSpot].
    final spots = <FlSpot>[
      for (final entry in _data.entries) FlSpot(entry.key, entry.value)
    ];

    /// !!Step3: prepare LineChartData
    /// !here we can set styles and behavior of the chart.
    final lineChartData = LineChartData(
      maxY: yMax,
      minY: yMin,
      minX: 0.5,
      maxX: 7.5,
      // The data to show.
      lineBarsData: [
        // ! Here we can style each data line.
        LineChartBarData(
          spots: spots,
          color: const Color(0xffEA5514),
          barWidth: 1.5,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) =>
                FlDotCirclePainter(
              radius: 1.5,
              color: Colors.white,
              strokeWidth: 1.5,
              strokeColor: const Color(0xffEA5514),
            ),
          ),
        ),
      ],
      // ! Behavior when touching the chart:
      lineTouchData: const LineTouchData(handleBuiltInTouches: false),
      // ! Borders:
      borderData: FlBorderData(
          show: true,
          border: const Border(
              top: BorderSide(color: Color(0xFF9FA0A0)),
              bottom: BorderSide(color: Color(0xFF9FA0A0)),
              left: BorderSide(color: Color(0xFF9FA0A0)))),
      // ! Grid behavior:
      gridData: FlGridData(
        show: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingHorizontalLine: (value) {
          if (value == yMin ||
              value == (yMin + yInterval) ||
              value == (yMin + yInterval * 2) ||
              value == yMax) {
            return const FlLine(color: Color(0xFF9FA0A0), strokeWidth: 1);
          }
          return const FlLine(strokeWidth: 0); // No line for other values
        },
        getDrawingVerticalLine: (value) => const FlLine(
          color: Color(0xFF9FA0A0),
          strokeWidth: 1,
        ),
      ),
      // ! Title and ticks in the axis
      titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 33,
              interval: 1,
              getTitlesWidget: getTitles,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: 1,
              getTitlesWidget: (double value, _) {
                if (value == yMin) {
                  return Text('$yMin');
                }
                if (value == (yMin + yInterval)) {
                  return Text('${(yMin + yInterval)}');
                }
                if (value == (yMin + yInterval * 2)) {
                  return Text('${(yMin + yInterval * 2)}');
                }
                if (value == yMax) {
                  return Text('$yMax');
                }
                return const SizedBox();
              },
            ),
          ),
          rightTitles: const AxisTitles(),
          topTitles: const AxisTitles()),
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text('FlLineChartExample'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: AspectRatio(aspectRatio: 2, child: LineChart(lineChartData)),
        ));
  }

  Widget getTitles(double value, TitleMeta meta) {
    if (value == 7.5) {
      return const SizedBox();
    }
    const style = TextStyle(color: Colors.black, fontSize: 11);
    AppDebug.log("value:$value");
    final now = DateTime.now();
    Widget text;
    switch (value.toInt()) {
      case 1:
        final title = DateFormat("MM/d\nE", "ja")
            .format(now.subtract(const Duration(days: 6)));
        text = Text(title, textAlign: TextAlign.center, style: style);
        break;
      case 2:
        final title = DateFormat("MM/d\nE", "ja")
            .format(now.subtract(const Duration(days: 5)));
        text = Text(title, textAlign: TextAlign.center, style: style);
        break;
      case 3:
        final title = DateFormat("MM/d\nE", "ja")
            .format(now.subtract(const Duration(days: 4)));
        text = Text(title, textAlign: TextAlign.center, style: style);
        break;
      case 4:
        final title = DateFormat("MM/d\nE", "ja")
            .format(now.subtract(const Duration(days: 3)));
        text = Text(title, textAlign: TextAlign.center, style: style);
        break;
      case 5:
        final title = DateFormat("MM/d\nE", "ja")
            .format(now.subtract(const Duration(days: 2)));
        text = Text(title, textAlign: TextAlign.center, style: style);
        break;
      case 6:
        final title = DateFormat("MM/d\nE", "ja")
            .format(now.subtract(const Duration(days: 1)));
        text = Text(title, textAlign: TextAlign.center, style: style);
        break;
      case 7:
        final title = DateFormat("MM/d\nE", "ja").format(now);
        text = Text(title, textAlign: TextAlign.center, style: style);
        break;
      default:
        text = const SizedBox();
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
