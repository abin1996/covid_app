import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid_app/bloc/blocs.dart';
import 'package:covid_app/models/models.dart';
import 'package:covid_app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:covid_app/bloc/covid_india_event.dart';
import 'package:covid_app/bloc/covid_india_state.dart';

class CovidIndiaBloc extends Bloc<CovidIndiaEvent, CovidIndiaState> {
  final CovidDataRepository covidDataRepository;
  CovidIndiaBloc({@required this.covidDataRepository})
      : assert(covidDataRepository != null);
  @override
  CovidIndiaState get initialState => CovidIndiaInitial();

  @override
  Stream<CovidIndiaState> mapEventToState(
    CovidIndiaEvent event,
  ) async* {
    if (event is FetchCovidData) {
      yield CovidIndiaLoading();
      try {
        final CombinedIndiaData combinedCovidData =
            await covidDataRepository.getStateCovidData();
        final List<StateDailyData> stateDailyCovidData =
            await covidDataRepository.getStateDailyCovidData();
        yield CovidIndiaLoaded(
            stateCovidData: combinedCovidData.stateCovidData,
            dailyCovidData: combinedCovidData.dailyCovidData,
            stateDailyCovidData: stateDailyCovidData);
      } catch (error) {
        yield CovidIndiaError();
      }
    }
    if (event is RefreshCovidData) {
      yield CovidIndiaLoading();
      try {
        final CombinedIndiaData combinedCovidData =
            await covidDataRepository.getStateCovidData();
        final List<StateDailyData> stateDailyCovidData =
            await covidDataRepository.getStateDailyCovidData();
        yield CovidIndiaLoaded(
            stateCovidData: combinedCovidData.stateCovidData,
            dailyCovidData: combinedCovidData.dailyCovidData,
            stateDailyCovidData: stateDailyCovidData);
      } catch (error) {
        yield CovidIndiaError();
      }
    }
  }
}
