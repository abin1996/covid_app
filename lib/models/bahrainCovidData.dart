import 'package:equatable/equatable.dart';

class BahrainCovidData extends Equatable {
  final DateTime lastUpdated;
  final int totalConfirmed;
  final int totalActive;
  final int totalRecovered;
  final int totalDeaths;
  final int totalCritical;
  final int todayConfirmed;
  final int todayDeaths;
  final int totalTests;

  const BahrainCovidData(
      {this.lastUpdated,
      this.totalActive,
      this.totalConfirmed,
      this.totalDeaths,
      this.totalCritical,
      this.totalRecovered,
      this.todayConfirmed,
      this.todayDeaths,
      this.totalTests});

  static BahrainCovidData fromJson(dynamic json, DateTime lastUpdated) {
    return BahrainCovidData(
        lastUpdated: lastUpdated,
        totalActive: json["active"],
        totalConfirmed: json['cases'],
        totalDeaths: json['deaths'],
        totalRecovered: json['recovered'],
        todayConfirmed: json['todayCases'],
        todayDeaths: json['todayDeaths'],
        totalCritical: json['critical'],
        totalTests: json['tests']);
  }

  @override
  List<Object> get props => [
        totalActive,
        totalConfirmed,
        totalDeaths,
        totalRecovered,
        totalCritical,
        todayConfirmed,
        todayDeaths,
        totalTests
      ];
}
