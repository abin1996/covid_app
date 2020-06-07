import 'package:covid_app/models/models.dart';
import 'package:covid_app/models/stateCovidData.dart';
import 'package:covid_app/ui/widgets/districtTable.dart';
import 'package:covid_app/ui/widgets/statewisePageHeader.dart';
import 'package:covid_app/ui/widgets/summaryCard.dart';
import 'package:flutter/material.dart';

class StateWiseData extends StatelessWidget {
  final StateCovidData stateData;
  final StateDailyData stateDailyCovidData;
  const StateWiseData({@required this.stateData, @required this.stateDailyCovidData});
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      color: Colors.black,
      child: SafeArea(
        child: ListView(children: <Widget>[
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
                      showChart: true,
                      dailyCovidData: stateDailyCovidData.stateDailyData,
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      cardColor: Colors.amberAccent[700],
                      totalValue: stateData.totalActive,
                      changeValue: stateData.deltaActive,
                      name: "Active",
                      showChart: true,
                      dailyCovidData: stateDailyCovidData.stateDailyData,
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
                      showChart: true,
                      dailyCovidData: stateDailyCovidData.stateDailyData,
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      cardColor: Colors.redAccent,
                      totalValue: stateData.totalDeaths,
                      changeValue: stateData.deltaDeaths,
                      name: "Deaths",
                      showChart: true,
                      dailyCovidData: stateDailyCovidData.stateDailyData,
                    ),
                  ),
                ],
              ),
            ],
          ),
          DistrictTable(districtData: stateData.districtData)
        ]),
      ),
    );
  }
}
