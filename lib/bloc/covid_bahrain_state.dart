
import 'package:covid_app/models/bahrainCovidData.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
abstract class CovidBahrainState extends Equatable {
  const CovidBahrainState();
  @override
  List<Object> get props => [];
}

class CovidBahrainInitial extends CovidBahrainState {}

class CovidBahrainLoading extends CovidBahrainState {}

class CovidBahrainLoaded extends CovidBahrainState {
  final BahrainCovidData bahrainCovidData;

  const CovidBahrainLoaded({@required this.bahrainCovidData});

  @override
  List<Object> get props => [bahrainCovidData];
}

class CovidBahrainError extends CovidBahrainState {}
