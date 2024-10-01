import 'package:brew_crew/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>?>(context) ?? [];

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(5),
          child: Card(
              margin: EdgeInsets.all(10),
              color: Colors.brown[50],
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/coffee_icon.png'),
                  radius: 25.0,
                  backgroundColor: Colors.brown[brews[index].strength],
                ),
                title: Text(brews[index].name),
                subtitle: Text('Takes ${brews[index].sugars} sugar(s)'),
                trailing: Text('${brews[index].strength}'),
              )),
        );
      },
    );
  }
}
