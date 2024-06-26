import 'package:flutter/material.dart';
import 'package:learn_shared_pref/pages/hive_page.dart';
import 'package:learn_shared_pref/pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HivePage(),
    );
  }
}
