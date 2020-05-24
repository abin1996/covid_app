import 'package:covid_app/model/globalTotalData.dart';
import 'package:covid_app/ui/widgets/globalSummary.dart';
import 'package:covid_app/ui/widgets/globalTable.dart';
import 'package:flutter/material.dart';
import 'package:covid_app/service/api.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:covid_app/ui/widgets/stateTable.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class Global extends StatelessWidget {
  final Future<CovidGlobalData> futureData;
  const Global({Key key, @required this.futureData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<CovidGlobalData>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            GlobalTotalData globalTotalData = snapshot.data.globalTotalData;
            return AnimationLimiter(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TotalGlobalSummary(totalGlobalData: globalTotalData),
                    GlobalTable(
                      globalTotalData: globalTotalData,
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default, show a loading spinner.
          // return CircularProgressIndicator();
          return SizedBox(
            width: 200,
            child: LinearProgressIndicator());
        },
      ),
    );
  }
}
