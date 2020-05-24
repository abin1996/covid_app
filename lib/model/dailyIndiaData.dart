import 'package:intl/intl.dart';
class CovidDailyIndiaData {
  int dailyConfirmed;
  int dailyRecovered;
  int dailyDeceased;
  int dailyActive;
  int totalConfirmed;
  int totalRecovered;
  int totalDeceased;
  int totalActive;
  DateTime date;
  CovidDailyIndiaData.fromJson(Map<String, dynamic> jsonMap) {
    this.dailyConfirmed = jsonMap['dailyconfirmed'];
    this.dailyDeceased = jsonMap['dailydeceased'];
    this.dailyRecovered = jsonMap['dailyrecovered'];
    this.dailyActive =
        this.dailyConfirmed - this.dailyDeceased - this.dailyRecovered;
    this.date = DateFormat('d MMMM').parse(jsonMap['date']);
    this.totalConfirmed = jsonMap['totalconfirmed'];
    this.totalDeceased = jsonMap['totaldeceased'];
    this.totalRecovered = jsonMap['totalrecovered'];
    this.totalActive =
        this.totalConfirmed - this.totalDeceased - this.totalRecovered;
  }
}
