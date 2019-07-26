import 'package:flutter/material.dart';
import 'package:forsight/src/models/event_model.dart';
import 'package:forsight/src/screens/scan.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailScreen extends StatefulWidget {
  EventDetailScreen({Key key, this.event}) : super(key: key);
  final EventModel event;
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 24.0,
              ),
              Container(
                alignment: Alignment.center,
                child: Hero(
                  tag: 'event-image-${widget.event.eventId}',
                  child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'asset/images/forsight_logo.jpeg')))),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Container(
                child: Text(
                  '${widget.event.title}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 24.0, right: 24.0),
                child: Divider(
                  height: 8.0,
                  color: Colors.grey[500],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                child: ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text(
                    'Latitude and Longitude ',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  subtitle: Text(
                    'Address',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 6.0),
                      decoration: BoxDecoration(
                          color: Colors.greenAccent[700],
                          borderRadius: BorderRadius.all(Radius.circular(6.0))),
                      child: IconButton(
                        icon: Icon(Icons.navigation),
                        color: Colors.white,
                        onPressed: () {
                          launch('comgooglemaps://');
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 6.0,
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                child: Text(
                  'Description Goes here , the desc field was empty that is why adding the dummy description',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                margin: EdgeInsets.only(
                    right: 24.0, left: 24.0, top: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Start Date',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                        color: Colors.cyan[700],
                      ), //overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${widget.event.startDate}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                        //color: Colors.cyan[700],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                margin: EdgeInsets.only(
                    right: 24.0, left: 24.0, top: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'End Date',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                        color: Colors.cyan[700],
                      ), //overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${widget.event.endDate}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                        //color: Colors.cyan[700],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(16.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(
                      builder: (context){
                        return ScanScreen();
                      }
                    ));
                  },
                  color: Colors.cyan[700],
                  textColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Scan QR Code',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                        //color: Colors.cyan[700],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
