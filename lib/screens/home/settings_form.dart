import 'package:brew_crew/models/myuser.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  //form values
  String _currentName = '';
  String _currentSugars = '';
  int _currentStrength = 100;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user?.uid ?? '').userData,
        //snapshot is the data from the stream.
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;
            return Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      'Update your brew settings.',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      initialValue: userData?.name,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() => _currentName = value);
                      },
                    ),
                    const SizedBox(height: 20.0),
                    // dropdown
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                        hintText: 'Sugars',
                      ),
                      value: _currentSugars.isEmpty
                          ? userData?.sugars
                          : _currentSugars,
                      items: sugars.map((sugar) {
                        return DropdownMenuItem(
                          value: sugar,
                          child: Text('$sugar sugars'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() => _currentSugars = value.toString());
                      },
                    ),
                    // slider
                    const SizedBox(height: 20.0),
                    Slider(
                      value:
                          (_currentStrength ?? userData?.strength)!.toDouble(),
                      min: 100.0,
                      max: 900.0,
                      divisions: 8,
                      activeColor: Colors
                          .brown[_currentStrength ?? userData?.strength ?? 100],
                      inactiveColor: Colors
                          .brown[_currentStrength ?? userData?.strength ?? 100],
                      onChanged: (value) =>
                          setState(() => _currentStrength = value.round()),
                    ),
                    // button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.pink,
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        print(_currentName);
                        print(_currentSugars);
                        print(_currentStrength);
                      },
                      child: const Text(
                        'Update',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ));
          } else {
            return Loading();
          }
        });
  }
}
