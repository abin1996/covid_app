import 'package:covid_app/models/models.dart';
import 'package:covid_app/models/stateCovidData.dart';
import 'package:equatable/equatable.dart';

class CombinedIndiaData extends Equatable{
  final List<StateCovidData> stateCovidData;
  final List<DailyData> dailyCovidData;
  const CombinedIndiaData({
    this.stateCovidData,
    this.dailyCovidData
  });

@override
  List<Object> get props => [
        stateCovidData,
        dailyCovidData
      ];
}
