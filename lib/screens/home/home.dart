import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: const Text('Brew Crew'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () async {
              //sign out
              await _auth.signOut();
            },
            icon: const Icon(Icons.person),
            label: const Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(
              iconColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
