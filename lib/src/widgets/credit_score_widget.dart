import 'package:flutter/material.dart';

class CreditScoreWidget extends StatefulWidget {
  CreditScoreWidget({Key key}) : super(key: key);

  _CreditScoreWidgetState createState() => _CreditScoreWidgetState();
}

class _CreditScoreWidgetState extends State<CreditScoreWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Text(
              '20',
              style: TextStyle(
                color: Colors.yellow[700],
                fontSize: 48.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Container(
            child: Text(
              'Your Credit Points',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
        ],
      ),
    );
  }
}
