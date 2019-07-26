import 'login_bloc.dart';
export 'login_bloc.dart';
import 'package:flutter/material.dart';


class LoginProvider extends InheritedWidget {
  LoginProvider({Key key, this.child}) :bloc = LoginBloc(), super(key: key, child: child);
  final LoginBloc bloc;
  final Widget child;

  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(LoginProvider)as LoginProvider).bloc;
  }

  @override
  bool updateShouldNotify( LoginProvider oldWidget) {
    return true;
  }
}