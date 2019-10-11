import 'package:flutter/material.dart';
import 'package:forsight/src/bloc/update_provider.dart';
import 'package:forsight/src/resources/repository.dart';
import 'package:forsight/src/screens/event_detail_screen.dart';
import 'package:forsight/src/screens/login_screen.dart';
import 'package:forsight/src/screens/main_screen.dart';

import 'bloc/login_provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LoginProvider(
      child: UpdateProvider(
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            accentColor: Colors.cyan,
            primarySwatch: Colors.cyan,
            backgroundColor: Colors.lightBlue,
            //hintColor: Colors.cyan[100],
            fontFamily: 'GoogleSans',
          ),
          onGenerateRoute: routes,
          //home: MainScreen(),
        ),
      ),
    );
  }

  Route routes(RouteSettings settings) {
    //var x= await Repository().fetchEvents();

    if (settings.name == '/') {
      //await Repository().fetchEvents();
      return MaterialPageRoute(builder: (context) {
        return LoginScreen();
      });
    } else if (settings.name == '/e') {
      return MaterialPageRoute(builder: (context) {
        return EventDetailScreen();
      });
    } else {
      return MaterialPageRoute(builder: (context) {
        final loginBloc = LoginProvider.of(context);
        loginBloc.login();
        return MainScreen();
      });
    }
  }
}
