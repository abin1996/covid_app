import 'package:covid_app/ui/pages/bahrain.dart';
import 'package:covid_app/ui/pages/india.dart';
import 'package:covid_app/ui/pages/global.dart';
import 'package:flutter/material.dart';
class CovidData extends StatefulWidget {
  CovidDataState createState() => CovidDataState();
}

class CovidDataState extends State<CovidData> {
  int _currentIndex = 0;
  List<Widget> _children = [];
  @override
  void initState() {
    super.initState();
    _children.add(India());
    _children.add(Bahrain());
    _children.add(Global());
    // futureBahrainData = fetchBahrainCovidData();
    // _children.add(Bahrain(futureData: futureBahrainData));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Scaffold(
          backgroundColor: Colors.black45,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(58, 66, 86, 0.4),
            title: Text(
              "COVID Status",
              style: TextStyle(color: Colors.white70),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color.fromRGBO(58, 66, 86, 0.4),
              unselectedItemColor: Colors.white60,
              selectedItemColor: Colors.deepPurpleAccent,
              currentIndex: _currentIndex,
              onTap: onTabTapped,
              items: [
                BottomNavigationBarItem(
                  icon: new Icon(Icons.home),
                  title: new Text('India'),
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.flight_takeoff),
                  title: new Text('Bahrain'),
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.public),
                  title: new Text('Global'),
                ),
              ]),
          body: _children[_currentIndex]),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
