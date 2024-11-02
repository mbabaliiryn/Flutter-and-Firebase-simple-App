import 'package:brew_crew/screens/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50], // Changed Color to Colors
      appBar: AppBar(
        title: Text('Brew Crew'),
        backgroundColor: Colors.brown[400], // Changed Color to Colors
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon( // Changed FlatButton to TextButton
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}