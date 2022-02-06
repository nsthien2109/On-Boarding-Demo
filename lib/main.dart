import 'package:flutter/material.dart';
import 'package:onboarding_custom/screens/home.dart';
import 'package:onboarding_custom/screens/on_boarding.dart';
import 'package:onboarding_custom/sharepreferences/share_pref.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isHome = false;

  @override
  void initState() {
    getStates();
    super.initState();
  }

  Future<void> getStates() async {
    final home = await getShowHome('showHome') ?? false;
    setState(() {
      isHome = home;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OnBoarding',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
      ),
      home: isHome == true ? const HomeScreen() :  const OnBoarding(),
    );
  }
}
