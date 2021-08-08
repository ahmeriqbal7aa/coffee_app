// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coffee_app/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  // Set userID to "UserOfFirebase" Class
  Usser _userFromFirebase(User user) {
    // return user != null ? Usser(uid: user.uid) : null;
    return Usser(uid: user.uid);
  }

  // auth change user stream
  Stream<Usser> get user {
    // ignore: deprecated_member_use
    return _auth.onAuthStateChanged.map(_userFromFirebase);
    // .map((User user) => _userFromFirebase(user));
  }

  // sign in anonymous
  Future signInAnonymous() async {
    try {
      // AuthResult authResult = await _auth.signInAnonymously();
      // FirebaseUser user = authResult.user;
      UserCredential credential = await _auth.signInAnonymously();
      User user = credential.user;
      // ignore: unnecessary_null_comparison
      if (user != null) {
        return _userFromFirebase(user);
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in with email and password

// register with email and password

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
