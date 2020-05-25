import 'package:covid_app/model/globalCountryData.dart';
import 'package:http/http.dart' as http;
import 'package:covid_app/model/bahData.dart';
import 'dart:convert' show json;
import 'package:covid_app/model/stateDistrictData.dart';
import 'package:covid_app/model/dailyIndiaData.dart';
import 'package:covid_app/model/globalTotalData.dart';
import 'package:covid_app/model/globalCountryData.dart';
import 'package:logger/logger.dart';

final logger = Logger();

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
    logger.i("Fetched India data");
    var decodedResponseBody = json.decode(response.body);
    return CovidIndiaData.fromJson(decodedResponseBody);
  } else {
    throw Error();
  }
}

Future<CovidDailyIndiaData> fetchDailyCovidData() async {
  final response = await http.get('https://api.covid19india.org/data.json');
  if (response.statusCode == 200) {
    logger.i("Fetched India daily data");
    var decodedResponseBody = json.decode(response.body);
    return CovidDailyIndiaData.fromJson(
        decodedResponseBody['cases_time_series']);
  } else {
    throw Error();
  }
}

Future<BahrainData> fetchBahrainCovidData() async {
  final response = await http.get(
      'https://api.apify.com/v2/key-value-stores/c7Bc6QnnwaPLOMv3J/records/LATEST?disableRedirect=true');
  if (response.statusCode == 200) {
    logger.i("Fetched Bahrain data");
    var decodedResponseBody = json.decode(response.body);
    return BahrainData.fromJson(decodedResponseBody);
  } else {
    throw Error();
  }
}

class CovidGlobalData {
  final GlobalTotalData globalTotalData;
  CovidGlobalData({this.globalTotalData});

  factory CovidGlobalData.fromJson(Map<String, dynamic> json) {
    List<GlobalCountryData> tempGlobalCountryData = [];
    GlobalTotalData tempGlobalTotalData;
    var allCountryData = json['Countries'];
    var totalSummaryJson = json['Global'];
    for (var i = 0; i < allCountryData.length; i++) {
      if (allCountryData[i]['TotalConfirmed'] > 1000) {
        tempGlobalCountryData
            .add(GlobalCountryData.fromJson(allCountryData[i]));
      }
    }
    tempGlobalCountryData
        .sort((b, a) => a.totalConfirmed.compareTo(b.totalConfirmed));
    tempGlobalTotalData = GlobalTotalData.fromJson(
        totalSummaryJson, json['Date'], tempGlobalCountryData);

    return CovidGlobalData(globalTotalData: tempGlobalTotalData);
  }
}

Future<CovidGlobalData> fetchGlobalCovidData() async {
  final response = await http.get('https://api.covid19api.com/summary');
  if (response.statusCode == 200) {
    logger.i("Fetched Global data");
    var decodedResponseBody = json.decode(response.body);
    return CovidGlobalData.fromJson(decodedResponseBody);
  }
  return Future.error("Failed to fetch Global Data");
}
