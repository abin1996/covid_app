import 'package:covid_app/bloc/blocs.dart';
import 'package:covid_app/models/globalCovidData.dart';
import 'package:covid_app/models/countriesCovidData.dart';
import 'package:covid_app/ui/widgets/globalSummary.dart';
import 'package:covid_app/ui/widgets/lastUpdated.dart';
import 'package:covid_app/ui/widgets/globalTable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Global extends StatefulWidget {
  State<Global> createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  Completer<void> _refreshCompleterGlobal;

  @override
  void initState() {
    super.initState();
    _refreshCompleterGlobal = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: BlocConsumer<CovidGlobalBloc, CovidGlobalState>(
          listener: (context, state) {
        if (state is CovidGlobalLoaded) {
          _refreshCompleterGlobal?.complete();
          _refreshCompleterGlobal = Completer();
        }
      }, builder: (context, state) {
        if (state is CovidGlobalInitial) {
          BlocProvider.of<CovidGlobalBloc>(context).add(FetchGlobalCovidData());
          return AnimationConfiguration.synchronized(
            child: FadeInAnimation(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        if (state is CovidGlobalLoading) {
          return AnimationConfiguration.synchronized(
            child: FadeInAnimation(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        if (state is CovidGlobalLoaded) {
          final List<CountryCovidData> allCountriesCovidData =
              state.countriesCovidData;
          GlobalCovidData globalData = state.globalCovidData;
          return RefreshIndicator(
            onRefresh: () {
              BlocProvider.of<CovidGlobalBloc>(context).add(
                RefreshGlobalCovidData(),
              );
              return _refreshCompleterGlobal.future;
            },
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: new BoxConstraints(),
                child: AnimationConfiguration.synchronized(
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
                                    dateTime: globalData.lastUpdated),
                              )),
                        ),
                      ),
                      FadeInAnimation(
                          child: GlobalSummary(globalData: globalData)),
                      SlideAnimation(
                        verticalOffset: 30,
                        duration: Duration(milliseconds: 200),
                        child: FadeInAnimation(
                          child: CountriesTable(
                              allCountriesCovidData: allCountriesCovidData),
                        ),
                      )
                      // IndiaSummary(
                      //   totalIndiaData: globalData,
                      // ),
                      // StateTable(indiaData: stateCovidData),
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
