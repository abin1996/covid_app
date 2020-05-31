import 'package:covid_app/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'dart:convert' show json;

class CovidDataApiClient {
  final logger = Logger();
  static const indiaUrl = 'https://api.covid19india.org';
  final http.Client httpClient;
  CovidDataApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<List<StateCovidData>> fetchStateCovidData() async {
    final response = await http.get('https://api.covid19india.org/data.json');
    logger.i("Api call for India data - Response code: " +
        response.statusCode.toString());
    if (response.statusCode == 200) {
      var decodedResponseBody = json.decode(response.body);
      var stateData = decodedResponseBody['statewise'];
      DateTime lastUpdated;
      List<StateCovidData> statesCovidData = new List<StateCovidData>();
      for (var i = 0; i < stateData.length; i++) {
        if(stateData[i]['state']!="State Unassigned"){
          lastUpdated = DateTime.now();
          statesCovidData.add(StateCovidData.fromJson(stateData[i], lastUpdated));
        }
          
      }
      return statesCovidData;
    } else {
      throw Future.error("Failed to fetch India Data.");
    }
  }

  Future<BahrainCovidData> fetchBahrainCovidData() async {
    final response = await http.get(
        'https://corona.lmao.ninja/v2/countries/Bahrain?yesterday=true&strict=true&query');
    logger.i("Api call for Bahrain data - Response code: " +
        response.statusCode.toString());
    if (response.statusCode == 200) {
      var bahrainDataJson = json.decode(response.body);
      DateTime lastUpdated = DateTime.now();
      BahrainCovidData bahrainCovidData =
          BahrainCovidData.fromJson(bahrainDataJson, lastUpdated);
      return bahrainCovidData;
    } else {
      throw Future.error("Failed to fetch Bahrain Data.");
    }
  }

  Future<GlobalCovidData> fetchGlobalCovidData() async {
    final response = await http.get('https://2019ncov.asia/api/cdr');
    logger.i("Api call for Global Summary data - Response code: " +
        response.statusCode.toString());
    if (response.statusCode == 200) {
      var globalDataJson = json.decode(response.body);
      DateTime lastUpdated = DateTime.now();
      GlobalCovidData globalCovidData =
          GlobalCovidData.fromJson(globalDataJson['results'], lastUpdated);
      return globalCovidData;
    } else {
      throw Future.error("Failed to fetch Global Data.");
    }
  }

  Future<List<CountryCovidData>> fetchAllCountriesCovidData() async {
    final response = await http.get('https://2019ncov.asia/api/country_region');
    logger.i("Api call for All Countries data - Response code: " +
        response.statusCode.toString());
    if (response.statusCode == 200) {
      var decodedResponseBody = json.decode(response.body);
      var countryData = decodedResponseBody['results'];
      DateTime lastUpdated;
      List<CountryCovidData> allCountriesCovidData =
          new List<CountryCovidData>();
      for (var i = 0; i < countryData.length; i++) {
        if (countryData[i]['confirmed'] > 1000) {
          lastUpdated = DateTime.now();
          allCountriesCovidData
              .add(CountryCovidData.fromJson(countryData[i], lastUpdated));
        }
      }
      allCountriesCovidData.sort((b,a) => a.totalConfirmed.compareTo(b.totalConfirmed));
      return allCountriesCovidData;
    } else {
      throw Future.error("Failed to fetch All country Data.");
    }
  }
}
