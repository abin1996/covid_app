import 'package:flutter/material.dart';
import 'package:covid_app/model/stateDistrictData.dart';
import 'package:covid_app/ui/widgets/stateDetailPageHearder.dart';
import 'package:covid_app/ui/widgets/stateSummaryCard.dart';
import 'package:covid_app/ui/widgets/districtTable.dart';

class StateDetails extends StatelessWidget {
  final StateData stateData;
  const StateDetails({Key key, @required this.stateData}) : super(key: key);
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
                PageHeader(title: stateData.state.toString()),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: StateSummaryCard(
                              cardColor: Colors.blueAccent,
                              totalValue: stateData.totalConfirmed,
                              changeValue: stateData.deltaState.deltaConfirmed,
                              numberFormatInternational: false,
                              name: "Confirmed",
                              ),
                            ),
                        Expanded(
                          child: StateSummaryCard(
                            cardColor: Colors.amberAccent[700],
                            totalValue: stateData.totalActive,
                            changeValue: stateData.deltaState.deltaActive,
                            numberFormatInternational: false,
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
                              totalValue: stateData.totalRecovered,
                              changeValue: stateData.deltaState.deltaRecovered,
                              numberFormatInternational: false,
                              name: "Recovered",
                            ),
                        ),
                        Expanded(
                          child: StateSummaryCard(
                            cardColor: Colors.redAccent,
                            totalValue: stateData.totalDeceased,
                            changeValue: stateData.deltaState.deltaDeceased,
                            numberFormatInternational: false,
                            name: "Deaths",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                DistrictTable(
                  stateData: stateData
                ),
              ]
            ),
      ),
    );
  }
}
