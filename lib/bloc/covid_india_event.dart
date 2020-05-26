import 'package:equatable/equatable.dart';

abstract class CovidIndiaEvent extends Equatable {
  const CovidIndiaEvent();
}

class FetchCovidData extends CovidIndiaEvent {
  const FetchCovidData();
  @override
  List<Object> get props => [];
}
