import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forsight/src/bloc/update_provider.dart';
import 'package:forsight/src/resources/forsight_shared_pref.dart';
import 'package:forsight/src/widgets/generic_input_widget.dart';
import 'package:rxdart/rxdart.dart';

class UpdateEducationScreen extends StatefulWidget {
  UpdateEducationScreen({Key key}) : super(key: key);

  _UpdateEducationScreenState createState() => _UpdateEducationScreenState();
}

class _UpdateEducationScreenState extends State<UpdateEducationScreen> {
  @override
  Widget build(BuildContext context) {
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
            'Update Details',
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

  @override
  void initState() {
    super.initState();
    controllers = [
      TextEditingController(text: ForsightSharedPrefs.qualificationDegree),
      TextEditingController(text: ForsightSharedPrefs.qualificationDiploma),
      TextEditingController(text: ForsightSharedPrefs.qualificationOther),
      TextEditingController(text: ForsightSharedPrefs.collegeName),
      TextEditingController(text: ForsightSharedPrefs.universityName),
      TextEditingController(text: ForsightSharedPrefs.otherInstituteName),
      TextEditingController(text: ForsightSharedPrefs.masterUniversityName),
      TextEditingController(text: ForsightSharedPrefs.studyCenterName),
      TextEditingController(text: ForsightSharedPrefs.yearOfPassingMaster),
      TextEditingController(text: ForsightSharedPrefs.yearOfPassingPhD),
      TextEditingController(text: ForsightSharedPrefs.yearOfPassingDiploma),
      TextEditingController(text: ForsightSharedPrefs.currentProfStatus),
      TextEditingController(text: ForsightSharedPrefs.currentDesignation),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final bloc = UpdateProvider.of(context);
    return ListView(
      children: <Widget>[
        GenericInputWidget(
          bloc: bloc,
          stream: bloc.qualDegree,
          onChange: bloc.changeQualDegree,
          labelText: 'Degree',
          controller: controllers[0],
          hintText: 'Example: BTech,MBBS,MD',
          keyboardType: TextInputType.text,
          icon: Icon(Icons.school),
          initialText: ForsightSharedPrefs.qualificationDegree,
        ),
        SizedBox(
          height: 18.0,
        ),
        GenericInputWidget(
          bloc: bloc,
          stream: bloc.qualDiploma,
          onChange: bloc.changeQualDiploma,
          controller: controllers[1],
          initialText: ForsightSharedPrefs.qualificationDiploma,
          keyboardType: TextInputType.text,
          icon: Icon(Icons.school),
          labelText: 'Diploma',
          hintText: 'Example: Diploma in XYZ',
        ),
        SizedBox(
          height: 18.0,
        ),
        GenericInputWidget(
          bloc: bloc,
          stream: bloc.qualOther,
          onChange: bloc.changeQualOther,
          keyboardType: TextInputType.text,
          controller: controllers[2],
          icon: Icon(Icons.school),
          initialText: ForsightSharedPrefs.qualificationOther,
          labelText: 'Other Qualifications',
          hintText: 'Example: MD',
        ),
        SizedBox(
          height: 18.0,
        ),
        GenericInputWidget(
          bloc: bloc,
          stream: bloc.college,
          keyboardType: TextInputType.text,
          controller: controllers[3],
          icon: Icon(Icons.school),
          onChange: bloc.changeCollegeName,
          initialText: ForsightSharedPrefs.collegeName,
          labelText: 'College Name',
          hintText: 'Example: AIIMS',
        ),
        SizedBox(
          height: 18.0,
        ),
        GenericInputWidget(
          bloc: bloc,
          stream: bloc.univversityName,
          keyboardType: TextInputType.text,
          icon: Icon(Icons.school),
          onChange: bloc.changeUniversityName,
          controller: controllers[4],
          initialText: ForsightSharedPrefs.universityName,
          labelText: 'University Name',
          hintText: 'Example: GGSIP University',
        ),
        SizedBox(
          height: 18.0,
        ),
        GenericInputWidget(
          bloc: bloc,
          keyboardType: TextInputType.text,
          icon: Icon(Icons.school),
          controller: controllers[5],
          stream: bloc.otherInstitureName,
          onChange: bloc.changeOtherInstituteName,
          initialText: ForsightSharedPrefs.otherInstituteName,
          labelText: 'Other Institute Name',
          hintText: 'Example: Diploma Institute',
        ),
        SizedBox(
          height: 18.0,
        ),
        GenericInputWidget(
          bloc: bloc,
          keyboardType: TextInputType.text,
          icon: Icon(Icons.school),
          controller: controllers[6],
          stream: bloc.masterUniversityName,
          onChange: bloc.changeMasterUniversityName,
          initialText: ForsightSharedPrefs.masterUniversityName,
          labelText: 'Masters University Name',
          hintText: 'Example: AIIMS',
        ),
        SizedBox(
          height: 18.0,
        ),
        GenericInputWidget(
          bloc: bloc,
          keyboardType: TextInputType.text,
          icon: Icon(Icons.school),
          stream: bloc.studyCenterName,
          controller: controllers[7],
          onChange: bloc.changeStudyCenterName,
          initialText: ForsightSharedPrefs.studyCenterName,
          labelText: 'Study Center Name',
          hintText: 'Example: XYZ Institute',
        ),
        SizedBox(
          height: 18.0,
        ),
        GenericInputWidget(
          bloc: bloc,
          keyboardType: TextInputType.datetime,
          icon: Icon(Icons.date_range),
          controller: controllers[8],
          stream: bloc.yearOfPassingMaster,
          onChange: bloc.changeYearOfPassingMaster,
          initialText: ForsightSharedPrefs.yearOfPassingMaster,
          labelText: 'Year Of Passing Masters',
          hintText: 'Example: 2005',
        ),
        SizedBox(
          height: 18.0,
        ),
        GenericInputWidget(
          bloc: bloc,
          keyboardType: TextInputType.datetime,
          icon: Icon(Icons.date_range),
          stream: bloc.yearOfPassingPhD,
          controller: controllers[9],
          initialText: ForsightSharedPrefs.yearOfPassingPhD,
          onChange: bloc.changeYearOfPassingPhD,
          labelText: 'Year Of Passing PhD',
          hintText: 'Example: 2008',
        ),
        SizedBox(
          height: 18.0,
        ),
        GenericInputWidget(
          bloc: bloc,
          stream: bloc.yearOfPassingDiploma,
          keyboardType: TextInputType.datetime,
          icon: Icon(Icons.date_range),
          controller: controllers[10],
          onChange: bloc.changeYearOfPassing,
          initialText: ForsightSharedPrefs.yearOfPassingDiploma,
          labelText: 'Year Of Passing Diploma',
          hintText: 'Example: 2001',
        ),
        SizedBox(
          height: 18.0,
        ),
        // GenericInputWidget(
        //   bloc: bloc,
        //   stream: bloc.currentlyWorking,
        //   keyboardType: TextInputType.datetime,
        //   icon: Icon(Icons.work),
        //   initialText: ForsightSharedPrefs.currentlyWorking,
        //   onChange: bloc.changeCurrentlyWorking,
        //   labelText: 'Currently Working',
        //   hintText: 'Currently working',
        // ),
        // SizedBox(
        //   height: 18.0,
        // ),
        GenericInputWidget(
          bloc: bloc,
          stream: bloc.currentProfStatus,
          keyboardType: TextInputType.text,
          icon: Icon(Icons.work),
          controller: controllers[11],
          onChange: bloc.changeCurrentProfStatus,
          initialText: ForsightSharedPrefs.currentProfStatus,
          labelText: 'Current Professional Status',
          hintText: 'Current Professional Status',
        ),
        SizedBox(
          height: 18.0,
        ),
        GenericInputWidget(
          bloc: bloc,
          keyboardType: TextInputType.text,
          icon: Icon(Icons.work),
          stream: bloc.currentDesignation,
          controller: controllers[12],
          onChange: bloc.changeCurrentDesignation,
          initialText: ForsightSharedPrefs.currentDesignation,
          labelText: 'Current Designation',
          hintText: 'Current Designation',
        ),
        SizedBox(
          height: 18.0,
        ),
        UpdateButton(),
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
                      await bloc.submitEducationDetail();
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
    bloc.submitEducationDetail().then((bool loggedIn) {
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
