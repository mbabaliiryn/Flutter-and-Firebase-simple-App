import 'package:brew_crew/screens/models/brew.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;

  // Constructor to initialize brew
  BrewTile({required this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            // Provide a default value if brew.strength is null
            backgroundColor: Colors.brown[brew.strength ?? 0] ?? Colors.brown[100],
          ),
          // Provide a default value if brew.name is null
          title: Text(brew.name ?? 'Unknown Brew'),
          // Handle the case where brew.sugars might be null
          subtitle: Text('Takes ${brew.sugars ?? '0'} sugar(s)'),
        ),
      ),
    );
  }
}
