import 'package:flutter/material.dart';
import 'package:covid_app/model/globalTotalData.dart';
import 'package:covid_app/ui/widgets/stateSummaryCard.dart';
class TotalGlobalSummary extends StatelessWidget {
  final GlobalTotalData totalGlobalData;
  const TotalGlobalSummary({Key key, @required this.totalGlobalData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(58, 66, 86, 0.0),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: StateSummaryCard(
                  cardColor: Colors.blueAccent,
                  totalValue: totalGlobalData.totalConfirmed,
                  changeValue: totalGlobalData.newConfirmed,
                  numberFormatInternational: true,
                  name: "Confirmed",
                ),
              ),
              Expanded(
                child: StateSummaryCard(
                  cardColor: Colors.amberAccent[700],
                  totalValue: totalGlobalData.totalActive,
                  changeValue: totalGlobalData.newActive,
                  numberFormatInternational: true,
                  name: "Active",
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: StateSummaryCard(
                  cardColor: Colors.green,
                  totalValue: totalGlobalData.totalRecovered,
                  changeValue: totalGlobalData.newRecovered,
                  numberFormatInternational: true,
                  name: "Recovered",
                  ),
                ),
              Expanded(
                child: StateSummaryCard(
                  cardColor: Colors.redAccent,
                  totalValue: totalGlobalData.totalDeaths,
                  changeValue: totalGlobalData.newDeaths,
                  numberFormatInternational: true,
                  name: "Deaths",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
