import 'package:covid_app/bloc/blocs.dart';
import 'package:covid_app/models/models.dart';
import 'package:covid_app/models/stateCovidData.dart';
import 'package:covid_app/ui/widgets/indiaSummary.dart';
import 'package:covid_app/ui/widgets/lastUpdated.dart';
import 'package:covid_app/ui/widgets/stateTable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class India extends StatefulWidget {
  State<India> createState() => _IndiaState();
}

class _IndiaState extends State<India> {
  Completer<void> _refreshCompleterIndia;

  @override
  void initState() {
    super.initState();
    _refreshCompleterIndia = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<CovidIndiaBloc, CovidIndiaState>(
          listener: (context, state) {
        if (state is CovidIndiaLoaded) {
          _refreshCompleterIndia?.complete();
          _refreshCompleterIndia = Completer();
        }
      }, builder: (context, state) {
        if (state is CovidIndiaInitial) {
          BlocProvider.of<CovidIndiaBloc>(context).add(FetchCovidData());
          return AnimationConfiguration.synchronized(
            child: FadeInAnimation(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        if (state is CovidIndiaLoading) {
          return AnimationConfiguration.synchronized(
            child: FadeInAnimation(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        if (state is CovidIndiaLoaded) {
          final List<StateCovidData> stateCovidData = state.stateCovidData;
          final List<DailyData> dailyCovidData = state.dailyCovidData;
          final List<StateDailyData> stateDailyCovidData =
              state.stateDailyCovidData;
          StateCovidData totalIndiaData = new StateCovidData();
          for (var i = 0; i < stateCovidData.length; i++) {
            if (stateCovidData[i].stateName == "Total") {
              totalIndiaData = stateCovidData[i];
            }
          }
          return RefreshIndicator(
            onRefresh: () {
              BlocProvider.of<CovidIndiaBloc>(context).add(
                RefreshCovidData(),
              );
              return _refreshCompleterIndia.future;
            },
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: new BoxConstraints(),
                child: AnimationConfiguration.synchronized(
                  duration: Duration(milliseconds: 100),
                  child: Column(
                    children: <Widget>[
                      SlideAnimation(
                        horizontalOffset: 50.0,
                        duration: Duration(milliseconds: 150),
                        child: FadeInAnimation(
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: LastUpdated(
                                    dateTime: totalIndiaData.lastUpdated),
                              )),
                        ),
                      ),
                      FadeInAnimation(
                        child: IndiaSummary(
                          totalIndiaData: totalIndiaData,
                          dailyCovidData: dailyCovidData,
                        ),
                      ),
                      SlideAnimation(
                          verticalOffset: 50.0,
                          duration: Duration(milliseconds: 350),
                          child: FadeInAnimation(
                              child: StateTable(
                            indiaData: stateCovidData,
                            stateDailyCovidData: stateDailyCovidData,
                          ))),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        if (state is CovidIndiaError) {
          return Text(
            'Oops...Could not fetch data!',
            style: TextStyle(fontSize: 25, color: Colors.white70),
          );
        }
      }),
    );
  }
}
