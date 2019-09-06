import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forsight/src/bloc/login_provider.dart';
import 'package:forsight/src/resources/forsight_shared_pref.dart';
import 'package:forsight/src/resources/repository.dart';
import 'scan.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Navigator.popAndPushNamed(context, '/m');
    // Repository().fetchEvents().then((_){
    //   Navigator.pushReplacementNamed(context, '/m');
    // });
    ForsightSharedPrefs().getToken().then((String token) {
      if (token != null) {
        Navigator.pushReplacementNamed(context, '/m');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      // appBar: AppBar(
      //   elevation: 0.0,
      //   title: Text(
      //     'Forsight',
      //     style: TextStyle(
      //       fontSize: 24.0,
      //     ),
      //   ),
      //   leading: Icon(Icons.visibility),
      // ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 48.0,
              ),
              Image.asset(
                'asset/images/forsight_logo.jpeg',
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(
                  top: 16.0,
                  right: 16.0,
                  left: 16.0,
                  bottom: 0.0,
                ),
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 32.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 8.0,
                        left: 8.0,
                      ),
                      child: ListTile(
                        //leading: Icon(Icons.ac_unit),
                        title: new UsernameTextField(),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 8.0,
                        left: 8.0,
                      ),
                      child: ListTile(
                        //leading: Icon(Icons.ac_unit),
                        title: new PasswordTextField(),
                      ),
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: new LoginButton(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatefulWidget {
  const LoginButton({
    Key key,
  }) : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
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
    final bloc = LoginProvider.of(context);
    return StreamBuilder(
        stream: bloc.submitValidate,
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
                      'Login',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  color: Colors.cyanAccent[700],
                  onPressed: snapshot.hasData
                      ? () {
                          setState(() {
                            visibleButton = false;
                            visibleProgress = true;
                          });
                          login(bloc);
                        }
                      : null,
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
        });
  }

  login(LoginBloc bloc) {
    bloc.submit().then((bool loggedIn) {
      if (loggedIn) {
        Navigator.pushReplacementNamed(context, '/m');
        setState(() {
          visibleButton = true;
          visibleProgress = false;
        });
      } else {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text('Login'),
                content: Text('Oops Cannot Login'),
                actions: <Widget>[
                  CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Try Again'),
                  ),
                ],
              );
            });
        setState(() {
          visibleButton = true;
          visibleProgress = false;
        });
      }
    });
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.of(context);
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              icon: Icon(Icons.lock_outline),
              errorText: snapshot.error,
            ),
          );
        });
  }
}

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LoginProvider.of(context);
    return StreamBuilder(
        stream: bloc.username,
        builder: (context, snapshot) {
          return TextField(
            decoration: InputDecoration(
              hintText: 'Username',
              labelText: 'Username',
              icon: Icon(Icons.account_circle),
              errorText: snapshot.error,
            ),
            onChanged: (value) {
              bloc.changeUsername(value);
            },
          );
        });
  }
}
