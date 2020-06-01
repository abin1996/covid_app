import 'package:flutter/material.dart';

class StatewisePageHeader extends StatelessWidget {
  final String title;
  StatewisePageHeader({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 6.0,
        vertical: 6.0,
      ),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w600,
                    color: Colors.white70.withOpacity(0.8),
                    fontFamily: "Niramit",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
