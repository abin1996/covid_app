import 'package:covid_app/bloc/blocs.dart';
import 'package:covid_app/models/stateCovidData.dart';
import 'package:covid_app/ui/widgets/indiaSummary.dart';
import 'package:covid_app/ui/widgets/stateTable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class India extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CovidIndiaBloc>(context).add(FetchCovidData());
    return Center(
      child: BlocBuilder<CovidIndiaBloc, CovidIndiaState>(
          builder: (context, state) {
        if (state is CovidIndiaInitial) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is CovidIndiaLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is CovidIndiaLoaded) {
          final List<StateCovidData> stateCovidData = state.stateCovidData;
          StateCovidData totalIndiaData = new StateCovidData();
          for (var i = 0; i < stateCovidData.length; i++) {
            if (stateCovidData[i].stateName == "Total") {
              totalIndiaData = stateCovidData[i];
            }
          }
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: new BoxConstraints(),
              child: Column(
                children: <Widget>[
                  IndiaSummary(
                    totalIndiaData: totalIndiaData,
                  ),
                  StateTable(indiaData: stateCovidData),
                ],
              ),
            ),
          );
        }
        if (state is CovidIndiaError) {
          return Text(
            'Something went wrong!',
            style: TextStyle(color: Colors.red),
          );
        }
      }),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Center(
//     child: FutureBuilder<CovidIndiaData>(
//       future: futureData,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//             return AnimationLimiter(
//               child: SingleChildScrollView(
//                 child: ConstrainedBox(
//                   constraints: new BoxConstraints(),
//                   child: Column(
//                     children: <Widget>[

//                       // TotalIndiaSummary(totalIndiaData: totalIndiaData),
//                       // StateTable(indiaData: totalIndiaData),
//                     ],
//                   ),
//                 ),
//               ),
//             );

//         } else if (snapshot.hasError) {
//           return Text("${snapshot.error}");
//         }
//         // By default, show a loading spinner.
//         return CircularProgressIndicator();
//       },
//     ),
//   );
