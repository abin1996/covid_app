import 'package:covid_app/models/stateCovidData.dart';
import 'package:flutter/material.dart';

class StateTable extends StatelessWidget {
  final List<StateCovidData> indiaData;
  const StateTable({Key key, @required this.indiaData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 6,
      ),
      child: Column(
        children: <Widget>[
          buildTableHeaderRow(),
          Column(
            children: buildTable(context),
          ),
        ],
      ),
    );
  }

  List<Widget> buildTable(BuildContext context) {
    return List<Widget>.generate(indiaData.length, (index) {
      if (indiaData[index].stateName == "Total" || indiaData[index].stateName == "State Unassigned") {
        return Container();
      }
      return buildTableRow(context, index, indiaData[index]);
    });
  }

  Widget buildTableRow(
      BuildContext context, int index, StateCovidData stateData) {
    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.all(1.5),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            //   onTap: () {
            //     Navigator.push(context,
            //         CupertinoPageRoute(
            //            builder: (context) => StateDetails(stateData: stateData)),
            // );
            //   },
            borderRadius: BorderRadius.circular(4),
            splashColor: Colors.blueAccent.withOpacity(0.3),
            highlightColor: Colors.blueAccent.withOpacity(0.15),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 16,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 1,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white.withAlpha(5),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Hero(
                        flightShuttleBuilder: flightShuttleBuilder,
                        tag: stateData.stateName.toString(),
                        child: Material(
                          type: MaterialType.transparency,
                          child: Text(
                            stateData.stateName,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.white70.withOpacity(0.7),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 1,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.blueAccent.withAlpha(10),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        stateData.totalConfirmed.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 1,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.amberAccent[700].withAlpha(10),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        stateData.totalActive.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.amberAccent[700],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 1,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.greenAccent[700].withAlpha(10),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        stateData.totalRecovered.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.greenAccent[700],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 1,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.redAccent.withAlpha(10),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        stateData.totalDeaths.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.redAccent[700],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTableHeaderRow() {
    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.symmetric(),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 16,
              child: Tooltip(
                message: "State",
                child: Container(
                  margin: EdgeInsets.only(right: 1),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white.withAlpha(20),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "State/UT",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: Colors.white70.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Tooltip(
                message: "Confirmed",
                child: Container(
                  margin: EdgeInsets.only(right: 1),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.blueAccent.withAlpha(25),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "C",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Tooltip(
                message: "Active",
                child: Container(
                  margin: EdgeInsets.only(right: 1),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.amberAccent[700].withAlpha(25),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "A",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: Colors.amberAccent[700],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Tooltip(
                message: "Recovered",
                child: Container(
                  margin: EdgeInsets.only(right: 1),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.greenAccent[700].withAlpha(25),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "R",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: Colors.greenAccent[700],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Tooltip(
                message: "Deceased",
                child: Container(
                  margin: EdgeInsets.only(right: 1),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.redAccent.withAlpha(25),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "D",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(toHeroContext).style,
      child: toHeroContext.widget,
    );
  }
}
