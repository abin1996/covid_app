import 'package:covid_app/model/globalCountryData.dart';
import 'package:covid_app/model/globalTotalData.dart';
import 'package:flutter/material.dart';
import 'package:covid_app/helper.dart';
import 'package:flutter/cupertino.dart';

class GlobalTable extends StatelessWidget {
  final GlobalTotalData globalTotalData;
  const GlobalTable({Key key, @required this.globalTotalData})
      : super(key: key);
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
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: globalTotalData.globalCountrydata.length,
              itemBuilder: (context, index) {
                return buildTableRow(index, globalTotalData.globalCountrydata[index]);
              }),
        ],
      ),
    );
  }

  Widget buildTableRow(int index, GlobalCountryData globalCountryData) {
    return Padding(
      padding: EdgeInsets.all(0.5),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
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
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        globalCountryData.country,
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
                      Helper.formatNumber(globalCountryData.totalConfirmed,
                          internationalFormat: true),
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
                      Helper.formatNumber(globalCountryData.totalActive,
                          internationalFormat: true),
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
                      Helper.formatNumber(globalCountryData.totalRecovered,
                          internationalFormat: true),
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
                      Helper.formatNumber(globalCountryData.totalDeaths,
                          internationalFormat: true),
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
                message: "Country",
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
                      "Country",
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
                message: "Deaths",
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
