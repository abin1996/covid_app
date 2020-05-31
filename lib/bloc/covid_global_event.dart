import 'package:equatable/equatable.dart';

abstract class CovidGlobalEvent extends Equatable {
  const CovidGlobalEvent();
}

class FetchGlobalCovidData extends CovidGlobalEvent {
  const FetchGlobalCovidData();
  @override
  List<Object> get props => [];
}

class RefreshGlobalCovidData extends CovidGlobalEvent {
  const RefreshGlobalCovidData();
  @override
  List<Object> get props => [];
}
