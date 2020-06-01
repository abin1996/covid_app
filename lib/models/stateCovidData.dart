import 'package:covid_app/models/districtStateCovidData.dart';
import 'package:equatable/equatable.dart';

class StateCovidData extends Equatable {
  final DateTime lastUpdated;
  final int totalConfirmed;
  final int totalActive;
  final int totalRecovered;
  final int totalDeaths;
  final int deltaConfirmed;
  final int deltaActive;
  final int deltaRecovered;
  final int deltaDeaths;
  final String stateName;
  final String stateCode;
  final String notes;
  final List<DistrictData> districtData;

  const StateCovidData(
      {this.lastUpdated,
      this.totalActive,
      this.totalConfirmed,
      this.totalDeaths,
      this.totalRecovered,
      this.deltaActive,
      this.deltaConfirmed,
      this.deltaDeaths,
      this.deltaRecovered,
      this.notes,
      this.stateName,
      this.stateCode,
      this.districtData});

  static StateCovidData fromJson(
      dynamic json, DateTime lastUpdated, List<DistrictData> districtData) {
    int deltaActive = int.parse(json['deltaconfirmed']) -
        int.parse(json['deltadeaths']) -
        int.parse(json['deltarecovered']);
    return StateCovidData(
        lastUpdated: lastUpdated,
        totalActive: int.parse(json['active']),
        totalConfirmed: int.parse(json['confirmed']),
        totalDeaths: int.parse(json['deaths']),
        totalRecovered: int.parse(json['recovered']),
        deltaConfirmed: int.parse(json['deltaconfirmed']),
        deltaDeaths: int.parse(json['deltadeaths']),
        deltaRecovered: int.parse(json['deltarecovered']),
        deltaActive: deltaActive,
        stateName: json['state'],
        stateCode: json['statecode'],
        notes: json['statenotes'],
        districtData: districtData);
  }

  @override
  List<Object> get props => [
        totalActive,
        totalConfirmed,
        totalDeaths,
        totalRecovered,
        deltaActive,
        deltaConfirmed,
        deltaDeaths,
        deltaRecovered,
        stateName,
        notes,
        districtData,
        stateCode
      ];
}
