import 'package:flutter/material.dart';
import 'package:covid_app/model/indiaData.dart';
import 'package:covid_app/service/api.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:covid_app/ui/widgets/indiaSummaryCard.dart';
import 'package:covid_app/ui/widgets/stateTable.dart';

class India extends StatelessWidget {
  final Future<CovidIndiaData> futureData;
  const India({Key key, @required this.futureData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<CovidIndiaData>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            IndiaData totalIndiaData = IndiaData(snapshot.data.stateData);
              return AnimationLimiter(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: new BoxConstraints(),
                    child: Column(
                      children: <Widget>[
                        TotalIndiaSummary(totalIndiaData: totalIndiaData),
                        StateTable(indiaData: totalIndiaData),
                      ],
                    ),
                  ),
                ),
              );
            
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default, show a loading spinner.
          return SizedBox(
            width: 200,
            child: LinearProgressIndicator());
        },
      ),
    );
  }
}
