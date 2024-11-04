import 'package:brew_crew/screens/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/screens/services/database.dart';
import 'package:brew_crew/screens/models/brew.dart';
import 'package:brew_crew/screens/models/user.dart'; // Ensure this import is correct
import 'package:brew_crew/screens/home/brew_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // Access the user from the provider
    final user = Provider.of<AppUser?>(context);

    return StreamProvider<List<Brew>>.value(
      // Stream of brews will be provided based on the user state
      value: user != null ? DatabaseService(uid: user.uid).brews : Stream.value([]),
      initialData: [],
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: BrewList(), // This will display the list of brews
      ),
    );
  }
}
