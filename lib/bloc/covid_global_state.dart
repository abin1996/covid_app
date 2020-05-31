import 'package:covid_app/models/globalCovidData.dart';
import 'package:covid_app/models/countriesCovidData.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CovidGlobalState extends Equatable {
  const CovidGlobalState();
  @override
  List<Object> get props => [];
}

class CovidGlobalInitial extends CovidGlobalState {}

class CovidGlobalLoading extends CovidGlobalState {}

class CovidGlobalLoaded extends CovidGlobalState {
  final GlobalCovidData globalCovidData;
  final List<CountryCovidData> countriesCovidData;

  const CovidGlobalLoaded({@required this.globalCovidData, @required this.countriesCovidData});

  @override
  List<Object> get props => [globalCovidData, countriesCovidData];
}

class CovidGlobalError extends CovidGlobalState {}
