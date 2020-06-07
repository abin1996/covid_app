import 'package:covid_app/models/models.dart';
import 'package:covid_app/models/stateCovidData.dart';
import 'package:covid_app/ui/widgets/summaryCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class IndiaSummary extends StatelessWidget {
  final StateCovidData totalIndiaData;
  final List<DailyData> dailyCovidData;
  const IndiaSummary({Key key, @required this.totalIndiaData, @required this.dailyCovidData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(58, 66, 86, 0.0),
      ),
      child: Column(
        children: <Widget>[
          SlideAnimation(
            horizontalOffset: 20,
            duration: Duration(milliseconds: 300),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: SummaryCard(
                    cardColor: Colors.blueAccent,
                    totalValue: totalIndiaData.totalConfirmed,
                    changeValue: totalIndiaData.deltaConfirmed,
                    name: "Confirmed",
                    showChart: true,
                    dailyCovidData: dailyCovidData,
                  ),
                ),
                Expanded(
                  child: SummaryCard(
                    cardColor: Colors.amberAccent[700],
                    totalValue: totalIndiaData.totalActive,
                    changeValue: totalIndiaData.deltaActive,
                    name: "Active",
                    showChart: true,
                    dailyCovidData: dailyCovidData,
                  ),
                ),
              ],
            ),
          ),
          SlideAnimation(
            horizontalOffset: 30,
            duration: Duration(milliseconds: 400),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: SummaryCard(
                    cardColor: Colors.green,
                    totalValue: totalIndiaData.totalRecovered,
                    changeValue: totalIndiaData.deltaRecovered,
                    name: "Recovered",
                    showChart: true,
                    dailyCovidData: dailyCovidData,
                  ),
                ),
                Expanded(
                  child: SummaryCard(
                    cardColor: Colors.redAccent,
                    totalValue: totalIndiaData.totalDeaths,
                    changeValue: totalIndiaData.deltaDeaths,
                    name: "Deaths",
                    showChart: true,
                    dailyCovidData: dailyCovidData,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
