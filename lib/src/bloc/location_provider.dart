import 'location_bloc.dart';
export 'location_bloc.dart';
import 'package:flutter/material.dart';


class LocationProvider extends InheritedWidget {
  final LocationBloc bloc;
  final Widget child;

  LocationProvider({Key key,this.child}):bloc = LocationBloc(),
   super(key:key,child:child);

   @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static LocationBloc of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(LocationProvider) as LocationProvider).bloc;
  }
}