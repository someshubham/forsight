import 'dart:io';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forsight/src/bloc/update_provider.dart';
import 'package:forsight/src/resources/forsight_shared_pref.dart';
import 'package:forsight/src/widgets/generic_input_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpdateLocationScreen extends StatefulWidget {
  UpdateLocationScreen({Key key}) : super(key: key);

  _UpdateLocationScreenState createState() => _UpdateLocationScreenState();
}

class _UpdateLocationScreenState extends State<UpdateLocationScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = UpdateProvider.of(context);
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
            'Update Location',
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
      bottomNavigationBar: CupertinoButton(
        borderRadius: BorderRadius.circular(0),
        child: Text(
          'Update',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        color: Colors.cyanAccent[700],
        onPressed: () async {
          await bloc.submitLocationDetail();
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: UpdateList(),
        ),
      ),
    );
  }
}

class UpdateList extends StatefulWidget {
  UpdateList({Key key}) : super(key: key);

  _UpdateListState createState() => _UpdateListState();
}

class _UpdateListState extends State<UpdateList> {
  List<TextEditingController> controllers;
  final _location = Location();

  getLocation(UpdateBloc bloc) async {
    LocationData currentLocation;
    try {
      currentLocation = await _location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    final coordinates =
        new Coordinates(currentLocation.latitude, currentLocation.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    Address address = addresses.first;
    String addressLine1 = address.addressLine.toString();
    String addressLine2 = address.featureName.toString();
    String orgCity = address.locality.toString();
    String orgState = address.adminArea.toString();
    String orgCountry = address.countryName.toString();
    String orgPincode = address.postalCode.toString();
    controllers[7].text = addressLine1;
    bloc.changeOrgAdd1(addressLine1);
    controllers[8].text = addressLine2;
    bloc.changeOrgAdd2(addressLine2);
    controllers[9].text = orgCity;
    bloc.changeOrgCity(orgCity);
    controllers[10].text = orgState;
    bloc.changeOrgState(orgState);
    controllers[11].text = orgCountry;
    bloc.changeOrgCountry(orgCountry);
    controllers[12].text = orgPincode;
    bloc.changeOrgPinCode(orgPincode);
  }

  @override
  void initState() {
    super.initState();
    controllers = [
      TextEditingController(text: ForsightSharedPrefs.resAddress1),
      TextEditingController(text: ForsightSharedPrefs.resAddress2),
      TextEditingController(text: ForsightSharedPrefs.resCity),
      TextEditingController(text: ForsightSharedPrefs.resState),
      TextEditingController(text: ForsightSharedPrefs.resCountry),
      TextEditingController(text: ForsightSharedPrefs.resPinCode),
      TextEditingController(text: ForsightSharedPrefs.nameOfOrganisation),
      TextEditingController(text: ForsightSharedPrefs.orgAddress1),
      TextEditingController(text: ForsightSharedPrefs.orgAddress2),
      TextEditingController(text: ForsightSharedPrefs.orgCity),
      TextEditingController(text: ForsightSharedPrefs.orgState),
      TextEditingController(text: ForsightSharedPrefs.orgCountry),
      TextEditingController(text: ForsightSharedPrefs.orgPinCode),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final bloc = UpdateProvider.of(context);
    return ListView(
      children: <Widget>[
        // GenericInputWidget(
        //   bloc: bloc,
        //   stream: bloc.resAdd1,
        //   onChange: bloc.changeResAdd1,
        //   icon: Icon(Icons.my_location),
        //   initialText: ForsightSharedPrefs.resAddress1,
        //   controller: controllers[0],
        //   labelText: 'Resendent Address Line 1',
        //   hintText: 'Address Line 1',
        // ),
        // SizedBox(
        //   height: 18.0,
        // ),
        // GenericInputWidget(
        //   bloc: bloc,
        //   stream: bloc.resAdd2,
        //   onChange: bloc.changeResAdd2,
        //   icon: Icon(Icons.my_location),
        //   controller: controllers[1],
        //   initialText: ForsightSharedPrefs.resAddress2,
        //   labelText: 'Resendent Address Line 2',
        //   hintText: 'Address Line 2',
        // ),
        // SizedBox(
        //   height: 18.0,
        // ),
        // GenericInputWidget(
        //   bloc: bloc,
        //   stream: bloc.resCity,
        //   icon: Icon(Icons.my_location),
        //   controller: controllers[2],
        //   initialText: ForsightSharedPrefs.resCity,
        //   onChange: bloc.changeResCity,
        //   labelText: 'Resident City',
        //   hintText: 'Example: Delhi',
        // ),
        // SizedBox(
        //   height: 18.0,
        // ),
        // GenericInputWidget(
        //   bloc: bloc,
        //   stream: bloc.resState,
        //   icon: Icon(Icons.my_location),
        //   controller: controllers[3],
        //   onChange: bloc.changeResState,
        //   initialText: ForsightSharedPrefs.resState,
        //   labelText: 'State',
        //   hintText: 'Example: Punjab',
        // ),
        // SizedBox(
        //   height: 18.0,
        // ),
        // GenericInputWidget(
        //   bloc: bloc,
        //   stream: bloc.resCountry,
        //   icon: Icon(Icons.my_location),
        //   controller: controllers[4],
        //   onChange: bloc.changeResCountry,
        //   labelText: 'Country',
        //   initialText: ForsightSharedPrefs.resCountry,
        //   hintText: 'Example: India',
        // ),
        // SizedBox(
        //   height: 18.0,
        // ),
        // GenericInputWidget(
        //   bloc: bloc,
        //   stream: bloc.resPinCode,
        //   icon: Icon(Icons.my_location),
        //   controller: controllers[5],
        //   onChange: bloc.changeResPinCode,
        //   initialText: ForsightSharedPrefs.resPinCode,
        //   labelText: 'Pin Code',
        //   hintText: 'Example: 110006',
        // ),
        // SizedBox(
        //   height: 18.0,
        // ),
        CupertinoButton(
          onPressed: () {
            getLocation(bloc);
          },
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.searchLocation,
                color: Colors.cyanAccent[700],
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Use Current Location',
                style: TextStyle(
                  color: Colors.cyanAccent[700],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GenericInputWidget(
          bloc: bloc,
          stream: bloc.nameOfOrg,
          icon: Icon(FontAwesomeIcons.hospital),
          controller: controllers[6],
          onChange: bloc.changeNameOfOrganisation,
          initialText: ForsightSharedPrefs.nameOfOrganisation,
          labelText: 'Name Of Organisation',
          hintText: 'Example: Ganga Ram hospital',
        ),
        SizedBox(
          height: 18.0,
        ),
        GenericInputWidget(
          bloc: bloc,
          stream: bloc.orgAdd1,
          onChange: bloc.changeOrgAdd1,
          initialText: ForsightSharedPrefs.orgAddress1,
          icon: Icon(FontAwesomeIcons.addressCard),
          controller: controllers[7],
          labelText: 'Organisation Address Line 1',
          hintText: 'Address Line 1',
        ),
        SizedBox(
          height: 18.0,
        ),
        GenericInputWidget(
          bloc: bloc,
          stream: bloc.orgAdd2,
          onChange: bloc.changeOrgAdd2,
          initialText: ForsightSharedPrefs.orgAddress2,
          icon: Icon(FontAwesomeIcons.solidAddressCard),
          controller: controllers[8],
          labelText: 'Organisation Address Line 2',
          hintText: 'Address Line 2',
        ),
        SizedBox(
          height: 18.0,
        ),
        GenericInputWidget(
          bloc: bloc,
          stream: bloc.orgCity,
          onChange: bloc.changeOrgCity,
          initialText: ForsightSharedPrefs.orgCity,
          icon: Icon(FontAwesomeIcons.city),
          controller: controllers[9],
          labelText: 'Organisation City',
          hintText: 'Example: Delhi',
        ),
        SizedBox(
          height: 18.0,
        ),
        GenericInputWidget(
          bloc: bloc,
          stream: bloc.orgState,
          onChange: bloc.changeOrgState,
          initialText: ForsightSharedPrefs.orgState,
          icon: Icon(FontAwesomeIcons.mapMarked),
          controller: controllers[10],
          labelText: 'Organisation State',
          hintText: 'Example: Punjab',
        ),
        SizedBox(
          height: 18.0,
        ),
        GenericInputWidget(
          bloc: bloc,
          stream: bloc.orgCountry,
          onChange: bloc.changeOrgCountry,
          initialText: ForsightSharedPrefs.orgCountry,
          icon: Icon(FontAwesomeIcons.globeAsia),
          controller: controllers[11],
          labelText: 'Organisation Country',
          hintText: 'Example: India',
        ),
        SizedBox(
          height: 18.0,
        ),
        GenericInputWidget(
          bloc: bloc,
          stream: bloc.orgPinCode,
          onChange: bloc.changeOrgPinCode,
          initialText: ForsightSharedPrefs.orgPinCode,
          icon: Icon(Icons.my_location),
          controller: controllers[12],
          labelText: 'Organisation Pin Code',
          hintText: 'Example: 110006',
        ),
        SizedBox(
          height: 18.0,
        ),
        //UpdateButton(),
      ],
    );
  }
}

class UpdateButton extends StatefulWidget {
  const UpdateButton({
    Key key,
  }) : super(key: key);

  @override
  _UpdateButtonState createState() => _UpdateButtonState();
}

class _UpdateButtonState extends State<UpdateButton> {
  bool visibleButton;
  bool visibleProgress;

  @override
  void initState() {
    super.initState();
    visibleButton = true;
    visibleProgress = false;
  }

  @override
  Widget build(BuildContext context) {
    final bloc = UpdateProvider.of(context);
    return Container(
      alignment: Alignment.center,
      child: StreamBuilder(
          stream: null,
          builder: (context, snapshot) {
            return Stack(
              children: [
                Visibility(
                  visible: visibleButton,
                  child: RaisedButton(
                    elevation: 0.0,
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Update',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    color: Colors.cyanAccent[700],
                    onPressed: () async {
                      await bloc.submitLocationDetail();
                      Navigator.pop(context);
                    },
                    disabledColor: Colors.cyanAccent[300],
                  ),
                ),
                Visibility(
                  visible: visibleProgress,
                  child: CircularProgressIndicator(
                      //valueColor: Colors.cyan,
                      //valueColo,
                      ),
                ),
              ],
            );
          }),
    );
  }

  login(UpdateBloc bloc) {
    bloc.submitLocationDetail().then((bool loggedIn) {
      if (loggedIn) {
        Navigator.pushReplacementNamed(context, '/m');
        setState(() {
          visibleButton = true;
          visibleProgress = false;
        });
      } else {
        print('nhi hua login');
        setState(() {
          visibleButton = true;
          visibleProgress = false;
        });
      }
    });
  }
}
