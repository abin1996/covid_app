import 'package:equatable/equatable.dart';

class CountryCovidData extends Equatable {
  final DateTime lastUpdated;
  final String countryName;
  final int totalConfirmed;
  final int totalActive;
  final int totalRecovered;
  final int totalDeaths;

  const CountryCovidData(
      {this.lastUpdated,
      this.countryName,
      this.totalActive,
      this.totalConfirmed,
      this.totalDeaths,
      this.totalRecovered});

  static CountryCovidData fromJson(dynamic json, DateTime lastUpdated) {
    var confirmed = json['confirmed'];
    var recovered = json['recovered'];
    var deaths = json['deaths'];
    var countryName = json['country_region'];
    var active = confirmed - recovered - deaths;
    return CountryCovidData(
        lastUpdated: lastUpdated,
        countryName: countryName,
        totalConfirmed: confirmed,
        totalActive: active,
        totalDeaths: deaths,
        totalRecovered: recovered);
  }

  @override
  List<Object> get props => [
        countryName,
        totalActive,
        totalConfirmed,
        totalDeaths,
        totalRecovered,
        lastUpdated
      ];
}
