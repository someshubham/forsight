import 'package:flutter/material.dart';
import 'package:forsight/src/resources/forsight_shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/app.dart';

void main() async {
  await ForsightSharedPrefs.init();
  runApp(MyApp());
}
