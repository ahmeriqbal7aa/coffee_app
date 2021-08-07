// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coffee_app/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  // Set userID to "UserOfFirebase" Class
  UserOfFirebase? _userFromFirebaseUser(User firebaseUser) {
    // ignore: unnecessary_null_comparison
    return firebaseUser != null ? UserOfFirebase(uid: firebaseUser.uid) : null;
  }

  // sign in anonymous
  Future signInAnonymous() async {
    try {
      // AuthResult authResult = await _auth.signInAnonymously();
      // FirebaseUser user = authResult.user;
      UserCredential credential = await _auth.signInAnonymously();
      User? firebaseUser = credential.user;
      return _userFromFirebaseUser(firebaseUser!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in with email and password

// register with email and password

// sign out

}
