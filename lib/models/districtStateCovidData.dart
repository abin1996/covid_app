import 'package:equatable/equatable.dart';

class DistrictData extends Equatable {
  final String district;
  final String notes;
  final int active;
  final int confirmed;
  final int deceased;
  final int recovered;
  final Delta delta;

  const DistrictData(
      {this.active,
      this.confirmed,
      this.deceased,
      this.delta,
      this.district,
      this.notes,
      this.recovered});
  static DistrictData fromJson(Map<String, dynamic> jsonMap) {
    var district = jsonMap["district"];
    var notes = jsonMap["notes"];
    var active = jsonMap["active"];
    var confirmed = jsonMap["confirmed"];
    var deceased = jsonMap["deceased"];
    var recovered = jsonMap["recovered"];
    var delta = Delta.fromJson(jsonMap["delta"]);
    return DistrictData(
        district: district,
        active: active,
        confirmed: confirmed,
        deceased: deceased,
        delta: delta,
        notes: notes,
        recovered: recovered);
  }

  @override
  List<Object> get props =>
      [district, confirmed, notes, recovered, deceased, delta, active];
}

class Delta extends Equatable {
  final int deltaConfirmed;
  final int deltaDeceased;
  final int deltaRecovered;
  final int deltaActive;
  const Delta({
    this.deltaConfirmed,
    this.deltaDeceased,
    this.deltaRecovered,
    this.deltaActive,
  });

  static Delta fromJson(Map<String, dynamic> jsonMap) {
    var deltaConfirmed = jsonMap["confirmed"];
    var deltaDeceased = jsonMap["deceased"];
    var deltaRecovered = jsonMap["recovered"];
    var deltaActive = deltaConfirmed - deltaRecovered - deltaDeceased;
    return Delta(
        deltaActive: deltaActive,
        deltaConfirmed: deltaConfirmed,
        deltaDeceased: deltaDeceased,
        deltaRecovered: deltaRecovered);
  }

  @override
  List<Object> get props =>
      [deltaActive, deltaConfirmed, deltaRecovered, deltaDeceased];
}
