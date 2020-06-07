import 'package:covid_app/models/models.dart';
import 'package:equatable/equatable.dart';

class StateDailyData extends Equatable {
  final List<DailyData> stateDailyData;
  final String stateCode;

  const StateDailyData({this.stateCode, this.stateDailyData});

  @override
  List<Object> get props => [stateCode, stateDailyData];
}
