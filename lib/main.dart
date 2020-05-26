
import 'package:covid_app/bloc/covid_india_bloc.dart';
import 'package:covid_app/repository/repository.dart';
import 'package:covid_app/simpleBlocDelegate.dart';
import 'package:covid_app/ui/pages/covidData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
void main(){
  BlocSupervisor.delegate = SimpleBlocDelegate(); 
  final CovidDataRepository covidDataRepository = CovidDataRepository(
    covidDataApiClient: CovidDataApiClient(
      httpClient: http.Client()));
  runApp(App(covidDataRepository:covidDataRepository));
      
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
      home: BlocProvider(
        create: (context) =>
            CovidIndiaBloc(covidDataRepository: covidDataRepository),
        child: CovidData(),
      ),
    );
  }
}



// class CovidData extends StatefulWidget {
//   CovidDataState createState() => CovidDataState();
// }

// class CovidDataState extends State<CovidData> {
//   Future<CovidIndiaData> futureData;
//   Future<BahrainData> futureBahrainData;
//   int _currentIndex = 0;
//   List<Widget> _children = [];
//   @override
//   void initState() {
//     super.initState();
//     futureData = fetchCovidData();
//     _children.add(India(futureData: futureData));
//     futureBahrainData = fetchBahrainCovidData();
//     _children.add(Bahrain(futureData: futureBahrainData));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       type: MaterialType.transparency,
//       child: Scaffold(
//           backgroundColor: Color.fromRGBO(58, 66, 86, 0.0),
//           appBar: AppBar(
//             backgroundColor: Color.fromRGBO(58, 66, 86, 0.2),
//             title: Text(
//               "COVID Status",
//               style: TextStyle(color: Colors.white70),
//             ),
//           ),
//           bottomNavigationBar: BottomNavigationBar(
//               backgroundColor: Color.fromRGBO(58, 66, 86, 0.2),
//               unselectedItemColor: Colors.white60,
//               selectedItemColor: Colors.deepPurpleAccent,
//               currentIndex: _currentIndex,
//               onTap: onTabTapped,
//               items: [
//                 BottomNavigationBarItem(
//                   icon: new Icon(Icons.home),
//                   title: new Text('India'),
//                 ),
//                 BottomNavigationBarItem(
//                   icon: new Icon(Icons.flight_takeoff),
//                   title: new Text('Bahrain'),
//                 ),
//               ]),
//           body: _children[_currentIndex]),
//     );
//   }

//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

  // Widget _buildRow(BuildContext context, StateData stateData) {
  //   final _Font = const TextStyle(fontSize: 18.0, color: Colors.white60);
  //   if (stateData.state == "State Unassigned") {
  //     return Container();
  //   }
  //   return Container(
  //     margin: EdgeInsets.all(8),
  //     decoration: BoxDecoration(
  //       color: Color.fromRGBO(58, 66, 86, 1.0),
  //       borderRadius: BorderRadius.circular(20.0),
  //       boxShadow: [
  //         BoxShadow(
  //           blurRadius: 2.0,
  //           spreadRadius: 0.0,
  //           offset: Offset(2.0, 2.0), // shadow direction: bottom right
  //         )
  //       ],
  //     ),
  //     child: ListTile(
  //       contentPadding: EdgeInsets.all(16),
  //       leading: CircleAvatar(
  //         child: Text(stateData.stateCode.toString()),
  //         backgroundColor: Colors.deepPurpleAccent,
  //         foregroundColor: Colors.black87,
  //       ),
  //       title: Hero(
  //         tag: "stateName" + stateData.state.toString(),
  //         child: Material(
  //           type: MaterialType.transparency,
  //           child: Text(
  //             stateData.state,
  //             style: _Font,
  //           ),
  //         ),
  //       ),
  //       trailing: Container(
  //         child: Text(
  //           stateData.totalActive.toString(),
  //           style: _Font,
  //         ),
  //       ),
  //       onTap: () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => StateDetails(stateData: stateData)),
  //         );
  //       },
  //     ),
  //   );
  // }

