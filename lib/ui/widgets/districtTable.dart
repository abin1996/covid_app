import 'package:covid_app/helper.dart';
import 'package:covid_app/models/districtStateCovidData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DistrictTable extends StatelessWidget {
  final List<DistrictData> districtData;
  const DistrictTable({Key key, @required this.districtData}) : super(key: key);
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
    return List<Widget>.generate(districtData.length, (index) {
      return buildTableRow(context, index, districtData[index]);
    });
  }

  Widget buildTableRow(
      BuildContext context, int index, DistrictData districtData) {
    int alpha = 20;
    if (index % 2 == 0) {
      alpha = 30;
    }
    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.all(1.5),
        child: Material(
          type: MaterialType.transparency,
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
                    color: Colors.white.withAlpha(alpha),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Hero(
                      flightShuttleBuilder: flightShuttleBuilder,
                      tag: districtData.district.toString(),
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text(
                          districtData.district,
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
                    color: Colors.white.withAlpha(alpha),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Helper.formatNumber(districtData.confirmed),
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
                    color: Colors.white.withAlpha(alpha),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Helper.formatNumber(districtData.active),
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
                    color: Colors.white.withAlpha(alpha),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Helper.formatNumber(districtData.recovered),
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
                    color: Colors.white.withAlpha(alpha),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      Helper.formatNumber(districtData.deceased),
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
                message: "District",
                child: Container(
                  margin: EdgeInsets.only(right: 1),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white.withAlpha(50),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "District",
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
                    color: Colors.blueAccent.withAlpha(50),
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
                    color: Colors.amberAccent[700].withAlpha(50),
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
                    color: Colors.greenAccent[700].withAlpha(50),
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
                    color: Colors.redAccent.withAlpha(50),
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
