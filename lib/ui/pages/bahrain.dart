import 'package:flutter/material.dart';
import 'package:covid_app/model/bahData.dart';
import 'package:covid_app/model/indiaData.dart';
import 'package:covid_app/service/api.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:covid_app/ui/widgets/bahrainDataTab.dart';
import 'package:covid_app/ui/widgets/indiaSummaryCard.dart';
import 'package:covid_app/ui/widgets/stateTable.dart';

class Bahrain extends StatelessWidget {
  final Future<BahrainData> futureData;
  const Bahrain({Key key, @required this.futureData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<BahrainData>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            BahrainData totalBahrainData = snapshot.data;
              return AnimationLimiter(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: new BoxConstraints(),
                    child: Column(
                      children: <Widget>[
                        TotalBahrainSummary(totalBahrainData: totalBahrainData),
                      ],
                    ),
                  ),
                ),
              );
            
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
