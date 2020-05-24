import 'package:covid_app/model/globalCountryData.dart';

class GlobalTotalData {
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  int totalActive;
  int newActive;
  List<GlobalCountryData> globalCountrydata;
  DateTime date;
  GlobalTotalData.fromJson(Map<String, dynamic> json, String date,
      List<GlobalCountryData> globalCountrydata) {
    this.newConfirmed = json['NewConfirmed'];
    this.totalConfirmed = json['TotalConfirmed'];
    this.newDeaths = json['NewDeaths'];
    this.totalDeaths = json['TotalDeaths'];
    this.newRecovered = json['NewRecovered'];
    this.totalRecovered = json['TotalRecovered'];
    this.totalActive =
        this.totalConfirmed - this.totalDeaths - this.totalRecovered;
    this.newActive = this.newConfirmed - this.newDeaths - this.newRecovered;
    this.date = DateTime.parse(date);
    this.globalCountrydata = globalCountrydata;
  }
}
