import 'dart:async';
import 'package:forsight/src/models/doctor_model.dart';
import 'package:forsight/src/models/user_model.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
class LoginBloc{

  final _repo = Repository();

  final _usernameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();


  final _userController = BehaviorSubject<DoctorModel>();

  Observable<DoctorModel> get user => _userController.stream;
  
  login() async{
    DoctorModel user = await _repo.getUserData();
    _userController.sink.add(user);
  }

  Function(String) get changeUsername => _usernameController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;


  Observable<String> get username => _usernameController.stream.transform(StreamTransformer.fromHandlers(
    handleData: (String username,sink){
      if (username.length != 0) {
      sink.add(username);
    } else {
      sink.addError('Username cannot be empty');
    }
    }
  ));

  Observable<String> get password => _passwordController.stream.transform(StreamTransformer.fromHandlers(
    handleData: (String password,sink){
      if (password.length >= 5) {
      sink.add(password);
    } else {
      sink.addError('Password must be of length greater than 5');
    }
    }
  ));

  Observable<bool> get submitValidate => Observable.combineLatest2(password, username, (p,u)=>true);


  Future<bool> submit() async{
    String username = _usernameController.value;
    String password = _passwordController.value;

    return await _repo.loginUser(username, password);

  }





  dispose(){
    _usernameController.close();
    _passwordController.close();
    _userController.close();
  }



}