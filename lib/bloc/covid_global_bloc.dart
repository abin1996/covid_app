import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid_app/models/globalCovidData.dart';
import 'package:covid_app/models/countriesCovidData.dart';
import 'package:covid_app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:covid_app/bloc/covid_global_event.dart';
import 'package:covid_app/bloc/covid_global_state.dart';

class CovidGlobalBloc extends Bloc<CovidGlobalEvent, CovidGlobalState> {
  final CovidDataRepository covidDataRepository;
  CovidGlobalBloc({@required this.covidDataRepository})
      : assert(covidDataRepository != null);
  @override
  CovidGlobalState get initialState => CovidGlobalInitial();

  @override
  Stream<CovidGlobalState> mapEventToState(
    CovidGlobalEvent event,
  ) async* {
    if (event is FetchGlobalCovidData) {
      yield CovidGlobalLoading();
      try {
        final GlobalCovidData globalCovidData =
            await covidDataRepository.getGlobalCovidData();
        final List<CountryCovidData> allCountriesCovidData =
            await covidDataRepository.getAllCountriesCovidData();
        yield CovidGlobalLoaded(
            countriesCovidData: allCountriesCovidData,
            globalCovidData: globalCovidData);
      } catch (error) {
        yield CovidGlobalError();
      }
    }
    if (event is RefreshGlobalCovidData) {
      yield CovidGlobalLoading();
      try {
        final GlobalCovidData globalCovidData =
            await covidDataRepository.getGlobalCovidData();
        final List<CountryCovidData> allCountriesCovidData =
            await covidDataRepository.getAllCountriesCovidData();
        yield CovidGlobalLoaded(
            countriesCovidData: allCountriesCovidData,
            globalCovidData: globalCovidData);
      } catch (error) {
        yield CovidGlobalError();
      }
    }
  }
}
