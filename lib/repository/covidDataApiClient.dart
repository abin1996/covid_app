import 'package:covid_app/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'dart:convert' show json;


class CovidDataApiClient {
  static const indiaUrl = 'https://api.covid19india.org';
  final http.Client httpClient;
  CovidDataApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<List<StateCovidData>> fetchStateCovidData() async {
    final response = await http.get('https://api.covid19india.org/data.json');
    if (response.statusCode == 200) {
      var decodedResponseBody = json.decode(response.body);
      var stateData = decodedResponseBody['statewise'];
      DateTime lastUpdated;
      List<StateCovidData> statesCovidData = new List<StateCovidData>();
      for (var i = 0; i < stateData.length; i++) {
        lastUpdated = DateFormat('dd/mm/yyyy hh:mm:ss').parse(stateData[i]['lastupdatedtime']);
        statesCovidData.add(StateCovidData.fromJson(stateData[i], lastUpdated));
      }
      return statesCovidData;
    } else {
      throw Exception("Failed to fetch Daily Data.");
    }
  }
}
