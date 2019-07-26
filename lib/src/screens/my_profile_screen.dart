import 'package:flutter/material.dart';
import 'package:forsight/src/bloc/login_provider.dart';
import 'package:forsight/src/bloc/update_provider.dart';
import 'package:forsight/src/models/doctor_model.dart';
import 'package:forsight/src/models/user_model.dart';
import 'package:forsight/src/resources/forsight_shared_pref.dart';
import 'package:forsight/src/screens/scan.dart';
import 'package:forsight/src/screens/update_profile_screen.dart';
import 'package:forsight/src/widgets/credit_score_widget.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.of(context);
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: bloc.user,
          builder: (context, AsyncSnapshot<DoctorModel> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return ProfileDisplay(user: snapshot.data);
            } else if (snapshot.hasError) {
              InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Text("ERROR OCCURRED, Tap to retry !"),
                  ),
                  onTap: () {});
            }
          },
        ),
      ),
    );
  }
}

class ProfileDisplay extends StatefulWidget {
  ProfileDisplay({Key key, this.user}) : super(key: key);
  final DoctorModel user;
  _ProfileDisplayState createState() => _ProfileDisplayState();
}

class _ProfileDisplayState extends State<ProfileDisplay> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 12.0,
              ),
              Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://elseif.in/oci/${widget.user.photo}')))),
              SizedBox(
                height: 12.0,
              ),
              Container(
                child: Text(
                  '${widget.user.name}',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                child: Text(
                  '${widget.user.emailAddress}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                child: Text(
                  '${widget.user.mobileNumber}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
            ],
          ),
        ),
        Container(
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
                  '${widget.user.currentProfStatus}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Container(
                child: Text(
                  '${widget.user.photo}',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        CreditScoreWidget(),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.cyanAccent[700],
                      highlightColor: Colors.cyanAccent,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ScanScreen();
                        }));
                      },
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text('Scan QR Code'),
                    SizedBox(
                      height: 2.0,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.orangeAccent[700],
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return UpdateProfileScreen();
                        }));
                      },
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text('Update Profile'),
                    SizedBox(
                      height: 2.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Column(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.location_searching),
                      color: Colors.greenAccent[700],
                      highlightColor: Colors.cyanAccent,
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text('Change Location'),
                    SizedBox(
                      height: 2.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
