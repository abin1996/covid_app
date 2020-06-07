import 'dart:async';
import 'package:covid_app/models/models.dart';
import 'package:covid_app/repository/repository.dart';
import 'package:meta/meta.dart';

class CovidDataRepository {
  final CovidDataApiClient covidDataApiClient;

  CovidDataRepository({@required this.covidDataApiClient})
      : assert(covidDataApiClient != null);

  Future<CombinedIndiaData> getStateCovidData() async {
    return covidDataApiClient.fetchStateCovidData();
  }

  Future<List<StateDailyData>> getStateDailyCovidData() async {
    return covidDataApiClient.fetchStateDailyCovidData();
  }

  Future<BahrainCovidData> getBahrainCovidData() async {
    return covidDataApiClient.fetchBahrainCovidData();
  }

  Future<List<CountryCovidData>> getAllCountriesCovidData() async {
    return covidDataApiClient.fetchAllCountriesCovidData();
  }

  Future<GlobalCovidData> getGlobalCovidData() async {
    return covidDataApiClient.fetchGlobalCovidData();
  }
}
