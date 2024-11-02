import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/screens/home/wrapper.dart';
import 'package:brew_crew/screens/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/screens/models/user.dart'; // Make sure you have this import

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value( // Use AppUser instead of User
      value: AuthService().user,
      initialData: null, // This should handle the null state
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
