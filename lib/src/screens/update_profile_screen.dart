import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forsight/src/bloc/update_provider.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileScreen extends StatefulWidget {
  UpdateProfileScreen({Key key}) : super(key: key);

  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
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
  File _image;

  Future getImage() async {
    var image;
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Select Image'),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () async {
                  image =
                      await ImagePicker.pickImage(source: ImageSource.camera);
                  setState(() {
                    _image = image;
                  });
                  Navigator.pop(context);
                },
                child: Text('Camera'),
              ),
              CupertinoDialogAction(
                onPressed: () async {
                  image =
                      await ImagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    _image = image;
                  });
                  Navigator.pop(context);
                },
                child: Text('Gallery'),
              ),
            ],
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Choose a option to pick an image'),
            ),
          );
        });

    //var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = UpdateProvider.of(context);
    return ListView(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: _image == null ?AssetImage('asset/images/forsight_logo.jpeg'):FileImage(_image)))),
        ),
        CupertinoButton(
          onPressed: () {
            getImage();
          },
          child: Text('Change Image'),
        ),
        SizedBox(
          height: 18.0,
        ),
        NameWidget(bloc: bloc),
        SizedBox(
          height: 18.0,
        ),
        DoBWidget(bloc: bloc),
        SizedBox(
          height: 18.0,
        ),
        MobileWidget(bloc: bloc),
        SizedBox(
          height: 18.0,
        ),
        EmailWidget(bloc: bloc),
        SizedBox(
          height: 18.0,
        ),
        QualificationWidget(bloc: bloc),
        SizedBox(
          height: 18.0,
        ),
        CollegeWidget(bloc: bloc),
        SizedBox(
          height: 18.0,
        ),
        AddressWidget(bloc: bloc),
        SizedBox(
          height: 18.0,
        ),
        AdditionalAddressWidget(bloc: bloc),
        SizedBox(
          height: 18.0,
        ),
        UpdateButton(),
      ],
    );
  }
}

class NameWidget extends StatelessWidget {
  const NameWidget({
    Key key,
    @required this.bloc,
  }) : super(key: key);

  final UpdateBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: StreamBuilder(
        stream: bloc.name,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            onChanged: bloc.changeName,
            //obscureText: true,
            decoration: InputDecoration(
              hintText: 'Name',
              labelText: 'Name',
              hintStyle: TextStyle(
                  //color: Colors.blue[50]
                  ),
              prefixIcon: Icon(Icons.face),
              border: OutlineInputBorder(),
              errorText: snapshot.error,
            ),
          );
        },
      ),
    );
  }
}

class DoBWidget extends StatefulWidget {
  const DoBWidget({
    Key key,
    @required this.bloc,
  }) : super(key: key);

  final UpdateBloc bloc;

  @override
  _DoBWidgetState createState() => _DoBWidgetState();
}

class _DoBWidgetState extends State<DoBWidget> {
  DateTime selectedDate = DateTime.now();
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController();
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1960, 8),
        lastDate: DateTime(2020));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
    _controller.text =
        '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
    widget.bloc.changeDob(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: StreamBuilder(
        stream: widget.bloc.dob,
        initialData: selectedDate.toLocal().toString(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            controller: _controller,
            onTap: () => _selectDate(context),
            onChanged: widget.bloc.changeDob,
            //obscureText: true,

            decoration: InputDecoration(
              hintText: 'Date Of Birth',
              labelText: 'Date Of Birth',
              hintStyle: TextStyle(
                  //color: Colors.blue[50]
                  ),
              prefixIcon: Icon(Icons.date_range),
              border: OutlineInputBorder(),
              errorText: snapshot.error,
            ),
          );
        },
      ),
    );
  }
}

class MobileWidget extends StatelessWidget {
  const MobileWidget({
    Key key,
    @required this.bloc,
  }) : super(key: key);

  final UpdateBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: StreamBuilder(
        stream: bloc.mobile,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            onChanged: bloc.changeMobile,
            //obscureText: true,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'Mobile',
              labelText: 'Mobile',
              hintStyle: TextStyle(
                  //color: Colors.blue[50]
                  ),
              prefixIcon: Icon(Icons.phone_android),
              border: OutlineInputBorder(),
              errorText: snapshot.error,
            ),
          );
        },
      ),
    );
  }
}

class EmailWidget extends StatelessWidget {
  const EmailWidget({
    Key key,
    @required this.bloc,
  }) : super(key: key);

  final UpdateBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: StreamBuilder(
        stream: bloc.email,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            //obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Email',
              labelText: 'Email',
              hintStyle: TextStyle(
                  //color: Colors.blue[50]
                  ),
              prefixIcon: Icon(Icons.mail),
              border: OutlineInputBorder(),
              errorText: snapshot.error,
            ),
          );
        },
      ),
    );
  }
}

class QualificationWidget extends StatelessWidget {
  const QualificationWidget({
    Key key,
    @required this.bloc,
  }) : super(key: key);

  final UpdateBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: StreamBuilder(
        stream: bloc.qualification,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            onChanged: bloc.changeQualification,
            //obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Qualification',
              labelText: 'Qualification',
              hintStyle: TextStyle(
                  //color: Colors.blue[50]
                  ),
              prefixIcon: Icon(Icons.accessibility_new),
              border: OutlineInputBorder(),
              errorText: snapshot.error,
            ),
          );
        },
      ),
    );
  }
}

class CollegeWidget extends StatelessWidget {
  const CollegeWidget({
    Key key,
    @required this.bloc,
  }) : super(key: key);

  final UpdateBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: StreamBuilder(
        stream: bloc.college,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            onChanged: bloc.changeCollege,
            //obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'College',
              labelText: 'College',
              hintStyle: TextStyle(
                  //color: Colors.blue[50]
                  ),
              prefixIcon: Icon(Icons.account_balance),
              border: OutlineInputBorder(),
              errorText: snapshot.error,
            ),
          );
        },
      ),
    );
  }
}

class AddressWidget extends StatefulWidget {
  const AddressWidget({
    Key key,
    @required this.bloc,
  }) : super(key: key);

  final UpdateBloc bloc;

  @override
  _AddressWidgetState createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: StreamBuilder(
        stream: widget.bloc.address,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            onChanged: widget.bloc.changeAddress,
            //obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Work Address',
              labelText: 'Work Address',
              hintStyle: TextStyle(
                  //color: Colors.blue[50]
                  ),
              prefixIcon: Icon(Icons.my_location),
              border: OutlineInputBorder(),
              errorText: snapshot.error,
            ),
          );
        },
      ),
    );
  }
}

class AdditionalAddressWidget extends StatefulWidget {
  const AdditionalAddressWidget({
    Key key,
    @required this.bloc,
  }) : super(key: key);

  final UpdateBloc bloc;

  @override
  _AdditionalAddressWidgetState createState() => _AdditionalAddressWidgetState();
}

class _AdditionalAddressWidgetState extends State<AdditionalAddressWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: StreamBuilder(
        stream: widget.bloc.address,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            onChanged: widget.bloc.changeAddress,
            //obscureText: true,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Addtional Address (if any )',
              labelText: 'Addtional Address',
              hintStyle: TextStyle(
                  //color: Colors.blue[50]
                  ),
              prefixIcon: Icon(Icons.my_location),
              border: OutlineInputBorder(),
              errorText: snapshot.error,
            ),
          );
        },
      ),
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
                    onPressed: () {
                      bloc.submit();
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
    bloc.submit().then((bool loggedIn) {
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
