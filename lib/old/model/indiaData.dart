import 'package:covid_app/model/stateDistrictData.dart';

class IndiaData {
  int totalConfirmed = 0;
  int totalActive = 0;
  int totalRecovered = 0;
  int totalDeceased = 0;
  Delta deltaIndia;
  List<StateData> stateData;
  IndiaData(List<StateData> stateData) {
    this.stateData = stateData;
    this.deltaIndia = new Delta();
    for (var i = 0; i < stateData.length; i++) {
      this.totalConfirmed += stateData[i].totalConfirmed;
      this.totalActive += stateData[i].totalActive;
      this.totalRecovered += stateData[i].totalRecovered;
      this.totalDeceased += stateData[i].totalDeceased;
      this.deltaIndia.deltaConfirmed += stateData[i].deltaState.deltaConfirmed;
      this.deltaIndia.deltaDeceased += stateData[i].deltaState.deltaDeceased;
      this.deltaIndia.deltaRecovered += stateData[i].deltaState.deltaRecovered;
      this.deltaIndia.deltaActive += stateData[i].deltaState.deltaActive;
    }
  }
}
