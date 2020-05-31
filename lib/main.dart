import 'package:covid_app/bloc/blocs.dart';
import 'package:covid_app/bloc/covid_india_bloc.dart';
import 'package:covid_app/repository/repository.dart';
import 'package:covid_app/simpleBlocDelegate.dart';
import 'package:covid_app/ui/pages/covidData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final CovidDataRepository covidDataRepository = CovidDataRepository(
      covidDataApiClient: CovidDataApiClient(httpClient: http.Client()));
  runApp(App(covidDataRepository: covidDataRepository));
}

class App extends StatelessWidget {
  final CovidDataRepository covidDataRepository;

  App({Key key, @required this.covidDataRepository})
      : assert(covidDataRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  CovidIndiaBloc(covidDataRepository: covidDataRepository)),
          BlocProvider(
              create: (context) =>
                  CovidBahrainBloc(covidDataRepository: covidDataRepository)),
          BlocProvider(
              create: (context) =>
                  CovidGlobalBloc(covidDataRepository: covidDataRepository))
        ],
        child: CovidData(),
      ),
    );
  }
}
