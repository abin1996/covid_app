import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid_app/models/bahrainCovidData.dart';
import 'package:covid_app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:covid_app/bloc/covid_bahrain_event.dart';
import 'package:covid_app/bloc/covid_bahrain_state.dart';

class CovidBahrainBloc extends Bloc<CovidBahrainEvent, CovidBahrainState> {
  final CovidDataRepository covidDataRepository;
  CovidBahrainBloc({@required this.covidDataRepository})
      : assert(covidDataRepository != null);
  @override
  CovidBahrainState get initialState => CovidBahrainInitial();

  @override
  Stream<CovidBahrainState> mapEventToState(
    CovidBahrainEvent event,
  ) async* {
    if (event is FetchBahrainCovidData) {
      yield CovidBahrainLoading();
      try {
        final BahrainCovidData bahrainCovidData =
            await covidDataRepository.getBahrainCovidData();
        yield CovidBahrainLoaded(bahrainCovidData: bahrainCovidData);
      } catch (error) {
        yield CovidBahrainError();
      }
    }
    if (event is RefreshBahrainCovidData){
      yield CovidBahrainLoading();
       try {
        final BahrainCovidData bahrainCovidData =
            await covidDataRepository.getBahrainCovidData();
        yield CovidBahrainLoaded(bahrainCovidData: bahrainCovidData);
      } catch (error) {
        yield CovidBahrainError();
      }
    }
  }
}
