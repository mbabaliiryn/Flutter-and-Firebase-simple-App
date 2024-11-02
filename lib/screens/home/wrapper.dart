import 'package:brew_crew/screens/authenticate/authenicate.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:brew_crew/screens/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);
   
   //return either home or authenticate
    if (user == null) {
      return  Authenticate();
    } else {
      return  Home();
    }
  }
}