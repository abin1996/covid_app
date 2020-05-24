import 'package:flutter/material.dart';
import 'package:covid_app/model/stateDistrictData.dart';
import 'package:covid_app/helper.dart';

class DistrictTable extends StatelessWidget {
  final StateData stateData;
  const DistrictTable({Key key, @required this.stateData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 32,
      ),
      child: Column(
        children: <Widget>[
          buildTableHeaderRow(),
          // Column(
          //   children: buildTable(),
          // ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: stateData.districtData.length,
              itemBuilder: (context, index) {
                return buildTableRow(index, stateData.districtData[index]);
              }),
        ],
      ),
    );
  }

  List<Widget> buildTable() {
    return List<Widget>.generate(stateData.districtData.length, (index) {
      return buildTableRow(index, stateData.districtData[index]);
    });
  }

  Widget buildTableRow(int index, DistrictData districtData) {
    return IntrinsicHeight(
      child: Padding(
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
                        Helper.formatNumber(districtData.confirmed, internationalFormat: false),
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
                        Helper.formatNumber(districtData.active, internationalFormat: false),
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
                        Helper.formatNumber(districtData.recovered, internationalFormat: false),
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
                        Helper.formatNumber(districtData.deceased, internationalFormat: false),
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
        ),),
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
                    color: Colors.white.withAlpha(20),
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
}
