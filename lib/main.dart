import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:learn_shared_pref/setup.dart';
import 'app.dart';

void main()async{
  await setup();
  runApp(const App());
}

