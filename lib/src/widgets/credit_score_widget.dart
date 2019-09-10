import 'package:flutter/material.dart';
import 'package:forsight/src/bloc/login_provider.dart';

class CreditScoreWidget extends StatefulWidget {
  CreditScoreWidget({Key key}) : super(key: key);

  _CreditScoreWidgetState createState() => _CreditScoreWidgetState();
}

class _CreditScoreWidgetState extends State<CreditScoreWidget> {
  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.of(context);
    return StreamBuilder(
      stream: bloc.cePointsStream,
      builder: (context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data) {
            case -1:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case -2:
              return Center(
                child: Text(
                  'Oops Something is wrong',
                  style: TextStyle(fontSize: 16),
                ),
              );
              break;
            default:
              return CreditScoreCard(
                cePoints: snapshot.data,
              );
              break;
          }
        }

        return Container();
      },
    );
  }
}

class CreditScoreCard extends StatelessWidget {
  final int cePoints;

  CreditScoreCard({Key key, this.cePoints}) : super(key: key);

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
              '$cePoints',
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
