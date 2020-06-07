import 'package:covid_app/models/globalCovidData.dart';
import 'package:covid_app/ui/widgets/summaryCard.dart';
import 'package:covid_app/ui/widgets/summaryCardGlobal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GlobalSummary extends StatelessWidget {
  final GlobalCovidData globalData;
  const GlobalSummary({Key key, @required this.globalData}) : super(key: key);
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
                  child: SummaryCardGlobal(
                    cardColor: Colors.blueAccent,
                    totalValue: globalData.totalConfirmed,
                    changeValue: null,
                    name: "Confirmed",
                  ),
                ),
                Expanded(
                  child: SummaryCardGlobal(
                    cardColor: Colors.amberAccent[700],
                    totalValue: globalData.totalActive,
                    changeValue: null,
                    name: "Active",
                  ),
                ),
              ],
            ),
          ),
          SlideAnimation(
            duration: Duration(milliseconds: 400),
            horizontalOffset: 30,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: SummaryCardGlobal(
                    cardColor: Colors.green,
                    totalValue: globalData.totalRecovered,
                    changeValue: null,
                    name: "Recovered",
                  ),
                ),
                Expanded(
                  child: SummaryCardGlobal(
                    cardColor: Colors.redAccent,
                    totalValue: globalData.totalDeaths,
                    changeValue: null,
                    name: "Deaths",
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
