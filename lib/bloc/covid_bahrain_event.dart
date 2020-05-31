import 'package:equatable/equatable.dart';

abstract class CovidBahrainEvent extends Equatable {
  const CovidBahrainEvent();
}

class FetchBahrainCovidData extends CovidBahrainEvent {
  const FetchBahrainCovidData();
  @override
  List<Object> get props => [];
}

class RefreshBahrainCovidData extends CovidBahrainEvent {
  const RefreshBahrainCovidData();
  @override
  List<Object> get props => [];
}
