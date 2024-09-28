import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew/models/myuser.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// create MyUser object based on User
  MyUser? _userfromFirebase(User user) {
    return MyUser(uid: user.uid);
  }

  Stream<MyUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userfromFirebase(user!));
  }

  //sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userfromFirebase(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password

  //register with email and password

  //sign out
}
