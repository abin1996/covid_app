import 'package:covid_app/models/models.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid_app/helper.dart';

class SummaryCard extends StatelessWidget {
  final Color cardColor;
  final int totalValue;
  final int changeValue;
  final String name;
  final bool showChart;
  final int CHART_LENGTH = 15;
  final List<DailyData> dailyCovidData;
  const SummaryCard(
      {Key key,
      @required this.cardColor,
      @required this.totalValue,
      @required this.name,
      @required this.changeValue,
      @required this.showChart,
      this.dailyCovidData})
      : super(key: key);

  Widget build(BuildContext context) {
    String sign;
    if (changeValue != null) {
      if (changeValue < 0) {
        sign = "";
      } else {
        sign = "+";
      }
    }

    return Container(
      height: 200,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cardColor.withAlpha(50),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
              blurRadius: 28,
              color: cardColor.withOpacity(0.01),
              offset: Offset(4, 8))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: cardColor.withOpacity(1),
                    ),
                  ),
                  changeValue == null
                      ? Container()
                      : AutoSizeText(
                          sign + Helper.formatNumber(changeValue),
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              color: cardColor),
                          maxLines: 1,
                        ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AutoSizeText(
              Helper.formatNumber(totalValue),
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w900, color: cardColor),
              maxLines: 1,
            ),
            SizedBox(
              height: 40,
            ),
            showChart ? Expanded(child: buildChart()) : Container()
          ],
        ),
      ),
    );
  }

  Widget buildChart() {
    var end = dailyCovidData.length - (2 * CHART_LENGTH);
    dailyCovidData.removeRange(0, end);

    List<SingleDayData> singleDayData = buildChartDataList(dailyCovidData);
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(48),
          ),
        ),
        child: LineChart(
          buildLineChart(singleDayData),
        ),
      ),
    );
  }

  LineChartData buildLineChart(List<SingleDayData> singleDayData) {
    List<Color> gradientColors = [cardColor.withAlpha(200)];
    return LineChartData(
      lineTouchData: LineTouchData(
          enabled: true,
          handleBuiltInTouches: true,
          touchTooltipData: LineTouchTooltipData(
              fitInsideHorizontally: true,
              tooltipBgColor: cardColor.withAlpha(50))),
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      clipData:
          FlClipData(top: false, bottom: false, left: false, right: false),
      minX: 0,
      minY: 0,
      maxY: singleDayData[CHART_LENGTH - 1].value.toDouble(),
      maxX: (CHART_LENGTH - 1).toDouble(),
      lineBarsData: [
        LineChartBarData(
          spots: buildFlSpots(singleDayData),
          isCurved: true,
          curveSmoothness: 0.25,
          colors: gradientColors,
          dotData: FlDotData(
            show: false,
          ),
          barWidth: 4,
          isStrokeCapRound: true,
          shadow: Shadow(
              blurRadius: 0, color: Colors.transparent, offset: Offset(0, 0)),
          belowBarData: BarAreaData(
            show: true,
            colors: [
              Colors.white.withAlpha(0),
            ],
            gradientFrom: Offset(0, 0),
            gradientTo: Offset(0.3, 1),
            spotsLine: BarAreaSpotsLine(
              show: true,
              flLineStyle: FlLine(
                color: Colors.white.withAlpha(50),
                strokeWidth: 1,
                dashArray: [8, 2],
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<FlSpot> buildFlSpots(List<SingleDayData> singleDayData) {
    List<FlSpot> flSpots = List();
    for (int i = 0; i < singleDayData.length; i++) {
      SingleDayData item = singleDayData[i];
      flSpots.add(FlSpot(i.toDouble(), item.value.toDouble()));
    }
    return flSpots;
  }

  List<SingleDayData> buildChartDataList(List<DailyData> dailyData) {
    List<SingleDayData> singleDayDataList = List();
    List<FlSpot> flSpots = List();
    if (this.name == "Confirmed") {
      for (int i = 0; i < CHART_LENGTH * 2; i = i + 2) {
        singleDayDataList.add(SingleDayData(
            date: dailyData[i].date, value: dailyData[i].totalConfirmed));
        flSpots
            .add(FlSpot(i.toDouble(), dailyData[i].totalConfirmed.toDouble()));
      }
    } else if (this.name == "Active") {
      for (int i = 0; i < CHART_LENGTH * 2; i = i + 2) {
        singleDayDataList.add(SingleDayData(
            date: dailyData[i].date, value: dailyData[i].totalActive));
        flSpots
            .add(FlSpot(i.toDouble(), dailyData[i].totalConfirmed.toDouble()));
      }
    } else if (this.name == "Recovered") {
      for (int i = 0; i < CHART_LENGTH * 2; i = i + 2) {
        singleDayDataList.add(SingleDayData(
            date: dailyData[i].date, value: dailyData[i].totalRecovered));
        flSpots
            .add(FlSpot(i.toDouble(), dailyData[i].totalConfirmed.toDouble()));
      }
    } else if (this.name == "Deaths") {
      for (int i = 0; i < CHART_LENGTH * 2; i = i + 2) {
        singleDayDataList.add(SingleDayData(
            date: dailyData[i].date, value: dailyData[i].totalDeaths));
        flSpots
            .add(FlSpot(i.toDouble(), dailyData[i].totalConfirmed.toDouble()));
      }
    }
    return singleDayDataList;
  }
}
