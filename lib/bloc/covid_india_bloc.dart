import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid_app/models/stateCovidData.dart';
import 'package:covid_app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
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
      try{
        final List<StateCovidData> stateCovidData = await covidDataRepository.getStateCovidData();
        yield CovidIndiaLoaded(stateCovidData: stateCovidData);
      }catch(error){
        yield CovidIndiaError();
      }

    }
  }
}
