class BahrainData {
  int tested;
  int stable;
  int existingCases;
  int critical;
  int recovered;
  int beingTreat;

  BahrainData.fromJson(Map<String, dynamic> json) {
    this.tested = json["tested"];
    this.existingCases = json["infected"];
    this.stable = json["stable"];
    this.critical = json["undercare"];
    this.recovered = json["deceased"];
    this.beingTreat = json["recipients"];
  }
}
