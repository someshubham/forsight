import 'update_bloc.dart';
export 'update_bloc.dart';
import 'package:flutter/material.dart';
class UpdateProvider extends InheritedWidget {
  UpdateProvider({Key key, this.child}) :bloc = UpdateBloc(), super(key: key, child: child);

  final Widget child;
  final UpdateBloc bloc;

  static UpdateBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(UpdateProvider)as UpdateProvider).bloc;
  }

  @override
  bool updateShouldNotify( UpdateProvider oldWidget) {
    return true;
  }
}