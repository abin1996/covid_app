import 'package:covid_app/bloc/blocs.dart';
import 'package:covid_app/models/bahrainCovidData.dart';
import 'package:covid_app/ui/widgets/bahrainSummary.dart';
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Bahrain extends StatefulWidget {
  State<Bahrain> createState() => _BahrainState();
}

class _BahrainState extends State<Bahrain> {
  Completer<void> _refreshCompleterBahrain;

  @override
  void initState() {
    super.initState();
    _refreshCompleterBahrain = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<CovidBahrainBloc, CovidBahrainState>(
          listener: (context, state) {
        if (state is CovidBahrainLoaded) {
          _refreshCompleterBahrain?.complete();
          _refreshCompleterBahrain = Completer();
        }
      }, builder: (context, state) {
        if (state is CovidBahrainInitial) {
          BlocProvider.of<CovidBahrainBloc>(context)
              .add(FetchBahrainCovidData());
          return AnimationConfiguration.synchronized(
            child: FadeInAnimation(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        if (state is CovidBahrainLoading) {
          return AnimationConfiguration.synchronized(
            child: FadeInAnimation(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        if (state is CovidBahrainLoaded) {
          final BahrainCovidData bahrainCovidData = state.bahrainCovidData;
          return RefreshIndicator(
            onRefresh: () {
              BlocProvider.of<CovidBahrainBloc>(context).add(
                RefreshBahrainCovidData(),
              );
              return _refreshCompleterBahrain.future;
            },
            child: BahrainSummary(totalBahrainData: bahrainCovidData),
          );
        }
        if (state is CovidBahrainError) {
          return Text(
            'Oops...Could not fetch data!',
            style: TextStyle(fontSize: 25, color: Colors.white70),
          );
        }
      }),
    );
  }
}
