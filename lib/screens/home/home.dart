import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService(uid: '').brews,
      initialData: null,
      child: Scaffold(
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
        body: const BrewList(),
      ),
    );
  }
}
