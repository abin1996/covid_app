import 'package:equatable/equatable.dart';

class GlobalCovidData extends Equatable {
  final DateTime lastUpdated;
  final int totalConfirmed;
  final int totalActive;
  final int totalRecovered;
  final int totalDeaths;

  const GlobalCovidData(
      {this.lastUpdated,
      this.totalActive,
      this.totalConfirmed,
      this.totalDeaths,
      this.totalRecovered});

  static GlobalCovidData fromJson(dynamic json, DateTime lastUpdated) {
    var confirmed = json[0]['confirmed'];
    var recovered = json[2]['recovered'];
    var deaths = json[1]['deaths'];
    var active = confirmed - recovered - deaths;
    return GlobalCovidData(
        lastUpdated: lastUpdated,
        totalConfirmed: confirmed,
        totalActive: active,
        totalDeaths: deaths,
        totalRecovered: recovered);
  }

  @override
  List<Object> get props => [
        totalActive,
        totalConfirmed,
        totalDeaths,
        totalRecovered,
        lastUpdated
      ];
}
