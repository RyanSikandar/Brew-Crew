import 'package:flutter/material.dart';

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
              value: _currentSugars.isEmpty ? '0' : _currentSugars,
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
              value: (_currentStrength).toDouble(),
              min: 100.0,
              max: 900.0,
              divisions: 8,
              activeColor: Colors.brown[_currentStrength ?? 100],
              inactiveColor: Colors.brown[_currentStrength ?? 100],
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
  }
}
