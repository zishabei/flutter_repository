import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/widget/app_debug.dart';
import 'package:intl/intl.dart';

/// !!Step1: prepare the data to plot.
final _data1 = <double, double>{1: 9, 2: 12, 3: 10, 4: 20, 5: 14, 6: 18, 7: 18};

class FlBarChartExample extends StatefulWidget {
  const FlBarChartExample({super.key});

  static Route get route {
    return MaterialPageRoute(builder: (_) {
      return const FlBarChartExample();
    });
  }

  @override
  _FlBarChartExampleState createState() => _FlBarChartExampleState();
}

class _FlBarChartExampleState extends State<FlBarChartExample> {
  double chartY = 30;

  @override
  Widget build(BuildContext context) {
    /// !!Step2: convert data into barGroups.
    final barGroups = <BarChartGroupData>[
      for (final entry in _data1.entries)
        BarChartGroupData(
          x: entry.key.toInt(),
          barRods: [
            BarChartRodData(
                width: 35,
                toY: entry.value,
                color: Colors.blue,
                borderRadius: BorderRadius.zero),
          ],
        ),
    ];

    /// !!Step3: prepare barChartData
    final barChartData = BarChartData(
      alignment: BarChartAlignment.spaceAround,
      maxY: chartY,
      barGroups: barGroups,
      barTouchData: BarTouchData(enabled: false),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xFFA5A5A5)),
      ),
      gridData: FlGridData(
        show: true,
        getDrawingHorizontalLine: (value) => const FlLine(
          color: Color(0xFFA5A5A5),
          dashArray: [2, 2],
          strokeWidth: 1,
        ),
        horizontalInterval: chartY / 4,
        verticalInterval: 1 / 7,
        getDrawingVerticalLine: (value) => const FlLine(
          color: Color(0xFFA5A5A5),
          dashArray: [2, 2],
          strokeWidth: 1,
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          drawBelowEverything: true,
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: chartY / 4,
            getTitlesWidget: (value, meta) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  NumberFormat("#,###").format(value.toInt()),
                  textAlign: TextAlign.right,
                ),
              );
            },
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
          ),
        ),
        rightTitles: const AxisTitles(),
        topTitles: const AxisTitles(),
      ),
      extraLinesData: ExtraLinesData(
        horizontalLines: [
          HorizontalLine(
            y: 3.3,
            color: Colors.pinkAccent,
            strokeWidth: 3,
            label: HorizontalLineLabel(
              show: true,
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(right: 5, bottom: 5),
              style: const TextStyle(color: Colors.black, fontSize: 14),
              labelResolver: (line) => '目標歩数',
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('fl_chart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: AspectRatio(
          aspectRatio: 1.5,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final barsSpace = 4.0 * constraints.maxWidth / 400;
              final barsWidth = 8.0 * constraints.maxWidth / 400;
              return BarChart(barChartData);
            },
          ),
        ),
      ),
    );
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
