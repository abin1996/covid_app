import 'package:http/http.dart' as http;
import 'package:covid_app/model/bahData.dart';
import 'dart:convert' show json;
import 'package:covid_app/model/stateDistrictData.dart';
import 'package:covid_app/model/dailyIndiaData.dart';

class CovidIndiaData {
  final List<StateData> stateData;
  CovidIndiaData({this.stateData});
  factory CovidIndiaData.fromJson(List<dynamic> json) {
    List<StateData> stateData = List<StateData>();
    for (var i = 0; i < json.length; i++) {
      stateData.add(StateData.fromJson(json[i]));
    }
    for (var i = 0; i < stateData.length; i++) {
      stateData[i]
          .districtData
          .sort((b, a) => a.confirmed.compareTo(b.confirmed));
    }
    stateData.sort((b, a) => a.totalConfirmed.compareTo(b.totalConfirmed));
    return CovidIndiaData(stateData: stateData);
  }
}

Future<CovidIndiaData> fetchCovidData() async {
  final response = await http
      .get('https://api.covid19india.org/v2/state_district_wise.json');
  if (response.statusCode == 200) {
    var decodedResponseBody = json.decode(response.body);
    return CovidIndiaData.fromJson(decodedResponseBody);
  } else {
    throw Exception("Failed to fetch Data.");
  }
}

Future<CovidDailyIndiaData> fetchDailyCovidData() async {
  final response = await http
      .get('https://api.covid19india.org/data.json');
  if (response.statusCode == 200) {
    var decodedResponseBody = json.decode(response.body);
    return CovidDailyIndiaData.fromJson(decodedResponseBody['cases_time_series']);
  } else {
    throw Exception("Failed to fetch Daily Data.");
  }
}

Future<BahrainData> fetchBahrainCovidData() async {
  final response = await http
      .get('https://api.apify.com/v2/key-value-stores/c7Bc6QnnwaPLOMv3J/records/LATEST?disableRedirect=true');
  if (response.statusCode == 200) {
    var decodedResponseBody = json.decode(response.body);
    return BahrainData.fromJson(decodedResponseBody);
  } else {
    throw Exception("Failed to fetch Bahrain Data.");
  }
}
