class CovidDailyIndiaData {
  int dailyConfirmed;
  int dailyRecovered;
  int dailyDeceased;
  int dailyActive;
  int totalConfirmed;
  int totalRecovered;
  int totalDeceased;
  int totalActive;
  String date;
  CovidDailyIndiaData.fromJson(Map<String, dynamic> jsonMap) {
    this.dailyConfirmed = jsonMap['dailyconfirmed'];
    this.dailyDeceased = jsonMap['dailydeceased'];
    this.dailyRecovered = jsonMap['dailyrecovered'];
    this.dailyActive =
        this.dailyConfirmed - this.dailyDeceased - this.dailyRecovered;
    this.date = jsonMap['date'];
  }
}
