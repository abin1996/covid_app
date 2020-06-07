import 'package:covid_app/models/dailyData.dart';
import 'package:covid_app/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'dart:convert' show json;

class CovidDataApiClient {
  final logger = Logger();
  final http.Client httpClient;
  CovidDataApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<CombinedIndiaData> fetchStateCovidData() async {
    final response = await http.get('https://api.covid19india.org/data.json');
    logger.i("Api call for India data - Response code: " +
        response.statusCode.toString());
    if (response.statusCode == 200) {
      final responseDistrict = await http
          .get('https://api.covid19india.org/v2/state_district_wise.json');
      logger.i("Api call for District data - Response code: " +
          responseDistrict.statusCode.toString());
      if (responseDistrict.statusCode == 200) {
        var districtJson = json.decode(responseDistrict.body);
        Map<String, List<DistrictData>> stateDistrictData = new Map();
        for (var i = 0; i < districtJson.length; i++) {
          var stateCode = districtJson[i]['statecode'];
          List<DistrictData> districtData = new List<DistrictData>();
          for (var j = 0; j < districtJson[i]['districtData'].length; j++) {
            var district = districtJson[i]['districtData'][j];
            districtData.add(DistrictData.fromJson(district));
          }
          districtData.sort((b, a) => a.confirmed.compareTo(b.confirmed));
          stateDistrictData[stateCode] = districtData;
        }
        var decodedResponseBody = json.decode(response.body);
        var stateData = decodedResponseBody['statewise'];
        var dailyDataJson = decodedResponseBody['cases_time_series'];
        DateTime date;
        List<DailyData> dailyCovidData = new List<DailyData>();
        DateTime lastUpdated;
        List<StateCovidData> statesCovidData = new List<StateCovidData>();
        for (var i = 0; i < stateData.length; i++) {
          if (stateData[i]['state'] != "State Unassigned") {
            var stateCode = stateData[i]['statecode'];
            var districtList = stateDistrictData[stateCode];
            lastUpdated = DateTime.now();
            statesCovidData.add(StateCovidData.fromJson(
                stateData[i], lastUpdated, districtList));
          }
        }
        for (var i = 0; i < dailyDataJson.length; i++) {
          if (int.parse(dailyDataJson[i]['totalconfirmed']) > 1000) {
            date = DateFormat('dd MMMM').parse(dailyDataJson[i]['date']);
            dailyCovidData.add(DailyData.fromJson(dailyDataJson[i], date));
          }
        }

        return CombinedIndiaData(
            dailyCovidData: dailyCovidData, stateCovidData: statesCovidData);
      } else {
        throw Future.error("Failed to fetch District Data");
      }
    } else {
      throw Future.error("Failed to fetch India Data.");
    }
  }

  Future<List<StateDailyData>> fetchStateDailyCovidData() async {
    final response =
        await http.get('https://api.covid19india.org/states_daily.json');
    logger.i("Api call for State Daily data - Response code: " +
        response.statusCode.toString());
    if (response.statusCode == 200) {
      var decodedJson = json.decode(response.body);
      List stateDailyDataJson = decodedJson['states_daily'] as List;
      List confirmedDailyData = stateDailyDataJson
          .where((item) => item["status"] == "Confirmed")
          .toList();
      List recoveredDailyData = stateDailyDataJson
          .where((item) => item["status"] == "Recovered")
          .toList();
      List deathsDailyData = stateDailyDataJson
          .where((item) => item["status"] == "Deceased")
          .toList();
      List<StateDailyData> allStateDailyData = new List<StateDailyData>();

      stateNamesMap.forEach((key, value) {
        var stateCode = key.toLowerCase();
        Map<String, Map<String, int>> dateMap =
            new Map<String, Map<String, int>>();
        confirmedDailyData.forEach((e) {
          Map<String, int> valueMap = Map();
          valueMap['confirmed'] = int.parse(e[stateCode]);
          dateMap[e['date']] = valueMap;
        });
        recoveredDailyData.forEach((e) {
          Map<String, int> valueMap = Map();
          valueMap['recovered'] = int.parse(e[stateCode]);
          dateMap[e['date']].addAll(valueMap);
        });
        deathsDailyData.forEach((e) {
          Map<String, int> valueMap = Map();
          valueMap['deaths'] = int.parse(e[stateCode]);
          dateMap[e['date']].addAll(valueMap);
        });

        List<DailyData> dailyData = new List<DailyData>();
        int cumulativeConfirmed = 0;
        int cumulativeActive = 0;
        int cumulativeRecovered = 0;
        int cumulativeDeaths = 0;
        dateMap.forEach((key, value) {
          DateTime date = DateFormat('dd-MMM-y').parse(key);
          int c = value['confirmed'];
          int r = value['recovered'];
          int d = value['deaths'];
          int a = c - r - d;
          cumulativeActive += a;
          cumulativeConfirmed += c;
          cumulativeDeaths += d;
          cumulativeRecovered += r;
          dailyData.add(new DailyData(
              date: date,
              totalActive: cumulativeActive,
              totalConfirmed: cumulativeConfirmed,
              totalDeaths: cumulativeDeaths,
              totalRecovered: cumulativeRecovered));
        });
        allStateDailyData.add(new StateDailyData(
            stateCode: stateCode.toUpperCase(), stateDailyData: dailyData));
      });

      return allStateDailyData;
    } else {
      throw Future.error("Failed to fetch Global Data.");
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
      allCountriesCovidData
          .sort((b, a) => a.totalConfirmed.compareTo(b.totalConfirmed));
      return allCountriesCovidData;
    } else {
      throw Future.error("Failed to fetch All country Data.");
    }
  }

  Map<String, String> stateNamesMap = {
    "AN": "Andaman and Nicobar Islands",
    "AP": "Andhra Pradesh",
    "AR": "Arunachal Pradesh",
    "AS": "Assam",
    "BR": "Bihar",
    "CH": "Chandigarh",
    "CT": "Chhattisgarh",
    "DD": "Daman and Diu",
    "DL": "Delhi",
    "DN": "Dadra and Nagar Heveli",
    "GA": "Goa",
    "GJ": "Gujarat",
    "HP": "Himachal Pradesh",
    "HR": "Haryana",
    "JH": "Jharkhand",
    "JK": "Jammu and Kashmir",
    "KA": "Karnataka",
    "KL": "Kerala",
    "LA": "Ladakh",
    "LD": "Lakshadweep",
    "MH": "Maharashtra",
    "ML": "Meghalaya",
    "MN": "Manipur",
    "MP": "Madhya Pradesh",
    "MZ": "Mizoram",
    "NL": "Nagaland",
    "OR": "Odisha",
    "PB": "Punjab",
    "PY": "Puduchery",
    "RJ": "Rajasthan",
    "SK": "Sikkim",
    "TG": "Telangana",
    "TN": "Tamil Nadu",
    "TR": "Tripura",
    "TT": "Total",
    "UP": "Uttar Pradesh",
    "UT": "Uttarakhand",
    "WB": "West Bengal",
  };
}
