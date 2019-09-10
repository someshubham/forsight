import 'dart:async';
import 'dart:io';
import 'package:forsight/src/models/doctor_model.dart';
import 'package:forsight/src/models/user_model.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final _repo = Repository();

  final _usernameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  int _cePoints;

  final _cePointsController = BehaviorSubject<int>();

  Observable<int> get cePointsStream => _cePointsController.stream;
  Function(int) get cePointsSink => _cePointsController.sink.add;

  updateCEPoints(int cePoints) async {
    _cePoints += cePoints;
    try {
      await _repo.updateCEPoints(_cePoints);
      cePointsSink(_cePoints);
    } catch (e) {
      print(e);
    }
  }

  fetchCEPoints() async {
    cePointsSink(-1);
    try {
      _cePoints = await _repo.getCEPoints();
      cePointsSink(_cePoints);
    } catch (e) {
      print('Error $e');
      cePointsSink(-2);
    }
  }

  clearCEPoints() {
    _cePoints = 0;
    cePointsSink(_cePoints);
  }

  LoginBloc() {
    //clearCEPoints();
    fetchCEPoints();
  }

  final _userController = BehaviorSubject<DoctorModel>();

  Observable<DoctorModel> get user => _userController.stream;

  final _loginDataController = BehaviorSubject<UserModel>();

  Observable<UserModel> get loginDataStream => _loginDataController.stream;
  Function(UserModel) get loginDataSink => _loginDataController.sink.add;

  login() async {
    DoctorModel user = await _repo.getUserData();
    _userController.sink.add(user);
  }

  getLoginData() async {
    UserModel loginData = await _repo.getLoginData();
    loginDataSink(loginData);
  }

  Function(String) get changeUsername => _usernameController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Observable<String> get username => _usernameController.stream.transform(
          StreamTransformer.fromHandlers(handleData: (String username, sink) {
        if (username.length != 0) {
          sink.add(username);
        } else {
          sink.addError('Username cannot be empty');
        }
      }));

  Observable<String> get password => _passwordController.stream.transform(
          StreamTransformer.fromHandlers(handleData: (String password, sink) {
        if (password.length >= 5) {
          sink.add(password);
        } else {
          sink.addError('Password must be of length greater than 5');
        }
      }));

  Observable<bool> get submitValidate =>
      Observable.combineLatest2(password, username, (p, u) => true);

  Future<bool> submit() async {
    String username = _usernameController.value;
    String password = _passwordController.value;

    return await _repo.loginUser(username, password);
  }

  dispose() {
    _usernameController.close();
    _passwordController.close();
    _userController.close();
    _loginDataController?.close();
    _cePointsController?.close();
  }
}
