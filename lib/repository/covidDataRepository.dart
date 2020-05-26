import 'dart:async';
import 'package:covid_app/models/models.dart';
import 'package:covid_app/repository/repository.dart';
import 'package:meta/meta.dart';

class CovidDataRepository {
  final CovidDataApiClient covidDataApiClient;

  CovidDataRepository({@required this.covidDataApiClient})
      : assert(covidDataApiClient != null);

  Future<List<StateCovidData>> getStateCovidData() async {
    return covidDataApiClient.fetchStateCovidData();
  }
}
