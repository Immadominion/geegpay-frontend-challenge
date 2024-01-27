import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geegpay_afrique/core/constants/env_colors.dart';
import 'package:geegpay_afrique/core/constants/env_strings.dart';

class DashboardChart extends StatefulWidget {
  const DashboardChart({super.key});

  @override
  State<DashboardChart> createState() => _DashboardChartState();
}

class _DashboardChartState extends State<DashboardChart> {
  static const double barWidth = 22;
  // const shadowOpacity = 0.2;
  static const mainItems = <int, List<double>>{
    0: [5, 3, 2.5, 8],
    1: [20, 2.7, 3, 6.5],
    2: [2.5, 2, 3.5, 6],
    3: [26, 1.5, 4, 6.5],
    4: [9, 2, 5, 9],
    5: [45, 1.5, 4.3, 10],
    6: [8, 4.8, 5, 5],
    7: [7, 1.5, 4, 6.5],
    8: [20, 2, 5, 9],
    9: [32, 1.5, 4.3, 10],
    10: [4.3, 4.8, 5, 5],
    11: [30, 1.5, 4, 6.5],
    12: [26, 2, 5, 9],
  };
  int touchedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    TextStyle style = TextStyle(color: GeegyColors.darkGreyColor, fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = GeegyStrings.jan;
        break;
      case 1:
        text = GeegyStrings.feb;
        break;
      case 2:
        text = GeegyStrings.mar;
        break;
      case 3:
        text = GeegyStrings.apr;
        break;
      case 4:
        text = GeegyStrings.may;
        break;
      case 5:
        text = GeegyStrings.jun;
        break;
      case 6:
        text = GeegyStrings.jul;
      case 7:
        text = GeegyStrings.aug;
      case 8:
        text = GeegyStrings.sep;
      case 9:
        text = GeegyStrings.oct;
      case 10:
        text = GeegyStrings.nov;
      case 11:
        text = GeegyStrings.dec;
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    TextStyle style = TextStyle(color: GeegyColors.darkGreyColor, fontSize: 10);
    String text;
    if (value == 0) {
      text = '0';
    } else {
      text = '${value.toInt()}.000';
    }
    return SideTitleWidget(
      angle: (value < 0 ? -45 : 45).toRadian(),
      axisSide: meta.axisSide,
      space: 4,
      child: Text(
        text,
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }

  BarChartGroupData generateGroup(
    int x,
    double value1,
  ) {
    final sum = value1;
    final isTouched = touchedIndex == x;
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      showingTooltipIndicators: isTouched ? [0] : [],
      barRods: [
        BarChartRodData(
          toY: sum,
          width: barWidth,
          gradient: isTouched
              ? LinearGradient(
                  colors: GeegyColors.containerGradient,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              : LinearGradient(colors: [
                  GeegyColors.primaryColorTransp,
                  GeegyColors.primaryColorTransp
                ]),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
          rodStackItems: [
            BarChartRodStackItem(
              0,
              value1,
              isTouched
                  ? GeegyColors.primaryColor
                  : GeegyColors.primaryColorTransp,
              BorderSide(
                color: Colors.transparent,
                width: isTouched ? 2 : 0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  bool isShadowBar(int rodIndex) => rodIndex == 1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.center,
            maxY: 50,
            minY: 0,
            groupsSpace: 120.w,
            barTouchData: BarTouchData(
              handleBuiltInTouches: false,
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: GeegyColors.secondaryColor,
              ),
              touchCallback: (FlTouchEvent event, barTouchResponse) {
                if (!event.isInterestedForInteractions ||
                    barTouchResponse == null ||
                    barTouchResponse.spot == null) {
                  setState(() {
                    touchedIndex = -1;
                  });
                  return;
                }
                final rodIndex = barTouchResponse.spot!.touchedRodDataIndex;
                if (isShadowBar(rodIndex)) {
                  setState(() {
                    touchedIndex = -1;
                  });
                  return;
                }
                setState(() {
                  touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
                });
              },
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 32,
                  getTitlesWidget: bottomTitles,
                ),
              ),
              topTitles: const AxisTitles(
                  sideTitles: SideTitles(
                showTitles: false,
              )),
              rightTitles: const AxisTitles(
                  sideTitles: SideTitles(
                showTitles: false,
              )),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: leftTitles,
                  interval: 10,
                  reservedSize: 42,
                ),
              ),
            ),
            gridData: FlGridData(
              show: true,
              checkToShowHorizontalLine: (value) => value % 5 == 0,
              drawHorizontalLine: true,
              getDrawingVerticalLine: (value) {
                if (value == 0) {
                  return FlLine(
                    color: GeegyColors.darkGreyColor,
                    strokeWidth: 0,
                  );
                }
                return FlLine(
                  color: GeegyColors.darkGreyColor,
                  strokeWidth: 0,
                );
              },
              // getDrawingHorizontalLine: (value) {
              //   print(value);

              //   return FlLine(
              //     color: GeegyColors.darkGreyColor,
              //     strokeWidth: 0.5,
              //   );
              // },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: mainItems.entries
                .map(
                  (e) => generateGroup(
                    e.key,
                    e.value[0],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

extension DegreeToRadian on num {
  double toRadian() {
    return this * (3.141592653589793238 / 180);
  }
}
