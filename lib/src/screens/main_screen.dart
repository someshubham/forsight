import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forsight/src/bloc/login_provider.dart';
import 'package:forsight/src/models/event_model.dart';
import 'package:forsight/src/models/user_model.dart';
import 'package:forsight/src/resources/forsight_api_provider.dart';
import 'package:forsight/src/resources/forsight_shared_pref.dart';
import 'package:forsight/src/resources/repository.dart';
import 'package:forsight/src/screens/event_detail_screen.dart';
import 'package:forsight/src/screens/my_profile_screen.dart';
import 'package:forsight/src/screens/scan.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ProfileScreen(),
    ScanScreen(),
    EventScreen(),
    //EventScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    //ForsightSharedPrefs().clearToken();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        title: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
          ),
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Forsight For Optometrist',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      backgroundColor: Colors.blue[50],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if(index == 3) {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text('Log Out'),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Are you sure you want to log out ?'),
                  ),
                  actions: <Widget>[
                    CupertinoButton(
                      child: Text('Yes'),
                      onPressed: () {
                        ForsightSharedPrefs().clearToken();
                        Navigator.pop(context);
                        Navigator.popAndPushNamed(context, '/');
                      },
                    ),
                    CupertinoButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              }
            );
          }else{
            setState(() {
            _currentIndex = index;
          });
          }
          
        },
        backgroundColor: Colors.white,
        selectedItemColor: Colors.cyanAccent[700],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text(
                'Home',
                style:
                    TextStyle(fontFamily: 'ProductSans', color: Colors.black),
              )),
              BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text(
                'Scan',
                style:
                    TextStyle(fontFamily: 'ProductSans', color: Colors.black),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.event, color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text(
                'Events',
                style:
                    TextStyle(fontFamily: 'ProductSans', color: Colors.black),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.power_settings_new, color: Color.fromARGB(255, 0, 0, 0)),
              title: new Text(
                'Log Out',
                style:
                    TextStyle(fontFamily: 'ProductSans', color: Colors.black),
              )),    

        ],
      ),
      body: _children[_currentIndex],
    );
  }
}

class EventScreen extends StatelessWidget {
  const EventScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: Repository().fetchEvents(),
          builder: (context, AsyncSnapshot<List<EventModel>> snapshot) {
            // if (!snapshot.hasData) {
            //   return Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }

            // return ListView.builder(
            //   itemCount: snapshot.data.length,
            //   itemBuilder: (context, index) {
            //     print('event Id ${snapshot.data[index].eventId}');
            //     return new EventCard(event: snapshot.data[index]);
            //   },
            // );

            return snapshot.connectionState == ConnectionState.done
                ? snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          print('event Id ${snapshot.data[index].eventId}');
                          return new EventCard(event: snapshot.data[index]);
                        },
                      )
                    : InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Text("ERROR OCCURRED, Tap to retry !"),
                        ),
                        onTap: () {})
                : Center(child:CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({Key key, this.event}) : super(key: key);
  final EventModel event;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EventDetailScreen(event: event);
        }));
      },
      child: Container(
        //height: 150,
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 14,
                ),
                Hero(
                  tag: 'event-image-${event.eventId}',
                  child: Container(
                      width: 120.0,
                      height: 120.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'asset/images/forsight_logo.jpeg')))),
                ),
                SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${event.title}',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0,
                              color: Colors
                                  .black), //overflow: TextOverflow.ellipsis,
                        ),
                        ListTile(
                          leading: Icon(Icons.location_on),
                          title: Text(
                            'Address',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ), //overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Start Date',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    color: Colors.cyan[700],
                  ), //overflow: TextOverflow.ellipsis,
                ),
                Text('${event.startDate}'),
                Text(
                  'End Date',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    color: Colors.cyan[700],
                  ), //overflow: TextOverflow.ellipsis,
                ),
                Text('${event.endDate}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/* ListTile(
                      trailing: Text('${event.startDate}'),
                      title: Text(
                      'Start Date',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),//overflow: TextOverflow.ellipsis,
                    ),
                    ),
                    ListTile(
                      trailing: Text('${event.endDate}'),
                      title: Text(
                      'End Date',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),//overflow: TextOverflow.ellipsis,
                    ),
                    ), */
