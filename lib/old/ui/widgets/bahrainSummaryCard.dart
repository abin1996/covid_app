import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid_app/helper.dart';

class BahrainSummaryCard extends StatelessWidget {
  final Color cardColor;
  final int totalValue;
  final String name;
  const BahrainSummaryCard({
    Key key,
    @required this.cardColor,
    @required this.totalValue,
    @required this.name,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        height: 110,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: cardColor.withAlpha(50),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
                blurRadius: 28,
                color: cardColor.withOpacity(0.01),
                offset: Offset(4, 8))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: cardColor.withOpacity(1),
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              AutoSizeText(
                Helper.formatNumber(totalValue),
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: cardColor),
                maxLines: 1,
              ),
              SizedBox(
                height: 4.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
