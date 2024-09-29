import 'package:brew_crew/models/myuser.dart';
import 'package:brew_crew/screens/authenticate/authenticate.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //Return Either Home or Authenticate widget
    final user = Provider.of<MyUser?>(context);
    // print(user);
    if (user != null) {
      return Home();
    }
    return const Authenticate();
  }
}
