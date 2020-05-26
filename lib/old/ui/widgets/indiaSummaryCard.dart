import 'package:flutter/material.dart';
import 'package:covid_app/model/indiaData.dart';
import 'package:covid_app/ui/widgets/stateSummaryCard.dart';

class TotalIndiaSummary extends StatelessWidget {
  final IndiaData totalIndiaData;
  const TotalIndiaSummary({Key key, @required this.totalIndiaData}) : super(key: key);
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
                  totalValue: totalIndiaData.totalConfirmed,
                  changeValue: totalIndiaData.deltaIndia.deltaConfirmed,
                  name: "Confirmed",
                ),
              ),
              Expanded(
                child: StateSummaryCard(
                  cardColor: Colors.amberAccent[700],
                  totalValue: totalIndiaData.totalActive,
                  changeValue: totalIndiaData.deltaIndia.deltaActive,
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
                  totalValue: totalIndiaData.totalRecovered,
                  changeValue: totalIndiaData.deltaIndia.deltaRecovered,
                  name: "Recovered",
                  ),
                ),
              Expanded(
                child: StateSummaryCard(
                  cardColor: Colors.redAccent,
                  totalValue: totalIndiaData.totalDeceased,
                  changeValue: totalIndiaData.deltaIndia.deltaDeceased,
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
