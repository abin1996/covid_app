import 'package:covid_app/models/stateCovidData.dart';
import 'package:covid_app/ui/widgets/districtTable.dart';
import 'package:covid_app/ui/widgets/statewisePageHeader.dart';
import 'package:covid_app/ui/widgets/summaryCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class StateWiseData extends StatelessWidget {
  final StateCovidData stateData;
  const StateWiseData({@required this.stateData});
  @override
  Widget build(BuildContext context) {
    return Material(         
          type: MaterialType.card,
          color: Colors.black,
          child: SafeArea(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                StatewisePageHeader(title: stateData.stateName.toString()),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: SummaryCard(
                              cardColor: Colors.blueAccent,
                              totalValue: stateData.totalConfirmed,
                              changeValue: stateData.deltaConfirmed,
                              name: "Confirmed",
                              ),
                            ),
                        Expanded(
                          child: SummaryCard(
                            cardColor: Colors.amberAccent[700],
                            totalValue: stateData.totalActive,
                            changeValue: stateData.deltaActive,
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
                              totalValue: stateData.totalRecovered,
                              changeValue: stateData.deltaRecovered,
                              name: "Recovered",
                            ),
                        ),
                        Expanded(
                          child: SummaryCard(
                            cardColor: Colors.redAccent,
                            totalValue: stateData.totalDeaths,
                            changeValue: stateData.deltaDeaths,
                            name: "Deaths",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                DistrictTable(districtData: stateData.districtData)
              ]
            ),
      ),
    );
  }
}
