import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/screens/authenticate/register.dart';


class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
 _AuthenticateSate createState() => _AuthenticateSate();
}

class _AuthenticateSate extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }
  @override

  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}