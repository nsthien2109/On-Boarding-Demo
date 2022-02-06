import 'package:flutter/material.dart';
import 'package:onboarding_custom/screens/on_boarding.dart';
import 'package:onboarding_custom/sharepreferences/share_pref.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, PageTransition(type: PageTransitionType.topToBottom, child: const OnBoarding()));
            removeHome('showHome');
          }, child: const Text('Sign out'))
        ],
      ),
      body: const Center(
        child: Text("HomeScreen"),
      ),
    );
  }
}