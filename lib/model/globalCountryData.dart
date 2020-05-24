class GlobalCountryData {
  String country;
  String countryCode;
  int newConfirmed;
  int totalConfirmed;
  int totalActive;
  int newActive;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  DateTime date;

  GlobalCountryData.fromJson(Map<String, dynamic> json) {
    this.country = json['Country'];
    this.countryCode = json['CountryCode'];
    this.newConfirmed = json['NewConfirmed'];
    this.totalConfirmed = json['TotalConfirmed'];
    this.newDeaths = json['NewDeaths'];
    this.totalDeaths = json['TotalDeaths'];
    this.newRecovered = json['NewRecovered'];
    this.totalRecovered = json['TotalRecovered'];
    this.totalActive =
        this.totalConfirmed - this.totalDeaths - this.totalRecovered;
    this.newActive =
        this.newConfirmed - this.newDeaths - this.newRecovered;
    this.date = DateTime.parse(json['Date']);
  }
}
