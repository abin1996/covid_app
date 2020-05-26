class StateData {
  String state;
  String stateCode;
  int totalActive = 0;
  int totalConfirmed = 0;
  int totalDeceased = 0;
  int totalRecovered = 0;
  List<DistrictData> districtData = List<DistrictData>();
  Delta deltaState;
  StateData.fromJson(Map<String, dynamic> jsonMap) {
    this.state = jsonMap["state"];
    this.stateCode = jsonMap["statecode"];
    final _districts = jsonMap["districtData"];
    for (var i = 0; i < _districts.length; i++) {
      this.districtData.add(new DistrictData.fromJson(_districts[i]));
    }
    this.deltaState = new Delta();
    for (var i = 0; i < districtData.length; i++) {
      this.totalActive += districtData[i].active;
      this.totalConfirmed += districtData[i].confirmed;
      this.totalDeceased += districtData[i].deceased;
      this.totalRecovered += districtData[i].recovered;
      this.deltaState.deltaConfirmed += districtData[i].delta.deltaConfirmed;
      this.deltaState.deltaDeceased += districtData[i].delta.deltaDeceased;
      this.deltaState.deltaRecovered += districtData[i].delta.deltaRecovered;
      this.deltaState.deltaActive += districtData[i].delta.deltaActive;
    }
  }
}

class DistrictData {
  String district;
  String notes;
  int active;
  int confirmed;
  int deceased;
  int recovered;
  Delta delta;
  DistrictData.fromJson(Map<String, dynamic> jsonMap) {
    this.district = jsonMap["district"];
    this.notes = jsonMap["notes"];
    this.active = jsonMap["active"];
    this.confirmed = jsonMap["confirmed"];
    this.deceased = jsonMap["deceased"];
    this.recovered = jsonMap["recovered"];
    this.delta = new Delta.fromJson(jsonMap["delta"]);
  }
}

class Delta {
  int deltaConfirmed;
  int deltaDeceased;
  int deltaRecovered;
  int deltaActive;
  Delta() {
    this.deltaConfirmed = 0;
    this.deltaDeceased = 0;
    this.deltaRecovered = 0;
    this.deltaActive = 0;
  }
  Delta.fromJson(Map<String, dynamic> jsonMap) {
    this.deltaConfirmed = jsonMap["confirmed"];
    this.deltaDeceased = jsonMap["deceased"];
    this.deltaRecovered = jsonMap["recovered"];
    this.deltaActive =
        this.deltaConfirmed - this.deltaRecovered - this.deltaDeceased;
  }
}
