import 'package:flutter/material.dart';
import 'package:covid_app/ui/widgets/bahrainSummaryCard.dart';
import 'package:covid_app/model/bahData.dart';

class TotalBahrainSummary extends StatelessWidget {
  final BahrainData totalBahrainData;
  const TotalBahrainSummary({Key key, @required this.totalBahrainData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(58, 66, 86, 0.0),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            BahrainSummaryCard(
      cardColor: Colors.blue,
      totalValue: totalBahrainData.tested,
      name: "Total Tested",
            ),
            BahrainSummaryCard(
      cardColor: Colors.amberAccent[700],
      totalValue: totalBahrainData.existingCases,
      name: "Total Active",
            ),
            BahrainSummaryCard(
      cardColor: Colors.redAccent,
      totalValue: totalBahrainData.critical,
      name: "Critical",
            ),
            BahrainSummaryCard(
      cardColor: Colors.greenAccent,
      totalValue: totalBahrainData.stable,
      name: "Stable",
            ),
            BahrainSummaryCard(
      cardColor: Colors.green,
      totalValue: totalBahrainData.recovered,
      name: "Recovered",
            ),
            BahrainSummaryCard(
      cardColor: Colors.purpleAccent,
      totalValue: totalBahrainData.beingTreat,
      name: "Being Treated",
            ),
          ],
        ),
    );
  }
}
