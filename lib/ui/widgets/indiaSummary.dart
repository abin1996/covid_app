import 'package:covid_app/models/stateCovidData.dart';
import 'package:covid_app/ui/widgets/summaryCard.dart';
import 'package:flutter/material.dart';
class IndiaSummary extends StatelessWidget {
  final StateCovidData totalIndiaData;
  const IndiaSummary({Key key, @required this.totalIndiaData}) : super(key: key);
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
                child: SummaryCard(
                  cardColor: Colors.blueAccent,
                  totalValue: totalIndiaData.totalConfirmed,
                  changeValue: totalIndiaData.deltaConfirmed,
                  name: "Confirmed",
                ),
              ),
              Expanded(
                child: SummaryCard(
                  cardColor: Colors.amberAccent[700],
                  totalValue: totalIndiaData.totalActive,
                  changeValue: totalIndiaData.deltaActive,
                  name: "Active",
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: SummaryCard(
                  cardColor: Colors.green,
                  totalValue: totalIndiaData.totalRecovered,
                  changeValue: totalIndiaData.deltaRecovered,
                  name: "Recovered",
                  ),
                ),
              Expanded(
                child: SummaryCard(
                  cardColor: Colors.redAccent,
                  totalValue: totalIndiaData.totalDeaths,
                  changeValue: totalIndiaData.deltaDeaths,
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
