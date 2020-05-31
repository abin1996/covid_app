import 'package:covid_app/models/models.dart';
import 'package:covid_app/ui/widgets/bahrainSummaryCard.dart';
import 'package:covid_app/ui/widgets/lastUpdated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class BahrainSummary extends StatelessWidget {
  final BahrainCovidData totalBahrainData;
  const BahrainSummary({Key key, @required this.totalBahrainData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(58, 66, 86, 0.0),
      ),
      child: AnimationConfiguration.staggeredList(
        position: 10,
        child: ListView(
          children: <Widget>[
            FadeInAnimation(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: LastUpdated(dateTime: totalBahrainData.lastUpdated),
              ),
            ),
            SlideAnimation(
              verticalOffset: 15,
              duration: Duration(milliseconds: 125),
              child: FadeInAnimation(
                child: BahrainSummaryCard(
                  cardColor: Colors.grey,
                  totalValue: totalBahrainData.totalTests,
                  changeValue: null,
                  name: "Total Tested",
                ),
              ),
            ),
            SlideAnimation(
              verticalOffset: 15,
              duration: Duration(milliseconds: 150),
              child: FadeInAnimation(
                child: BahrainSummaryCard(
                  cardColor: Colors.blue,
                  totalValue: totalBahrainData.totalConfirmed,
                  changeValue: totalBahrainData.todayConfirmed,
                  name: "Confirmed Cases",
                ),
              ),
            ),
            SlideAnimation(
              verticalOffset: 15,
              duration: Duration(milliseconds: 200),
              child: FadeInAnimation(
                child: BahrainSummaryCard(
                  cardColor: Colors.amberAccent[700],
                  totalValue: totalBahrainData.totalActive,
                  name: "Active Cases",
                ),
              ),
            ),
            SlideAnimation(
              verticalOffset: 15,
              duration: Duration(milliseconds: 250),
              child: FadeInAnimation(
                child: BahrainSummaryCard(
                  cardColor: Colors.redAccent[100],
                  totalValue: totalBahrainData.totalCritical,
                  name: "In Critical condition",
                ),
              ),
            ),
            SlideAnimation(
              verticalOffset: 15,
              duration: Duration(milliseconds: 300),
              child: FadeInAnimation(
                child: BahrainSummaryCard(
                  cardColor: Colors.green,
                  totalValue: totalBahrainData.totalRecovered,
                  name: "Recovered Cases",
                ),
              ),
            ),
            SlideAnimation(
              verticalOffset: 15,
              duration: Duration(milliseconds: 350),
              child: FadeInAnimation(
                child: BahrainSummaryCard(
                  cardColor: Colors.red,
                  totalValue: totalBahrainData.totalDeaths,
                  changeValue: totalBahrainData.todayDeaths,
                  name: "Deaths",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
