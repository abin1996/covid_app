import 'package:covid_app/models/models.dart';
import 'package:covid_app/models/stateCovidData.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CovidIndiaState extends Equatable {
  const CovidIndiaState();
  @override
  List<Object> get props => [];
}

class CovidIndiaInitial extends CovidIndiaState {}

class CovidIndiaLoading extends CovidIndiaState {}

class CovidIndiaLoaded extends CovidIndiaState {
  final List<StateCovidData> stateCovidData;
  final List<DailyData> dailyCovidData;
  final List<StateDailyData> stateDailyCovidData;

  const CovidIndiaLoaded(
      {@required this.stateCovidData,
      @required this.dailyCovidData,
      @required this.stateDailyCovidData});

  @override
  List<Object> get props => [stateCovidData];
}

class CovidIndiaError extends CovidIndiaState {}
