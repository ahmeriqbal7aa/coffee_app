import 'package:firebase_auth/firebase_auth.dart';
import 'package:coffee_app/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  // Set userID to "UserOfFirebase" Class
  Usser _userFromFirebase(User user) {
    return user != null ? Usser(uid: user.uid) : null;
    // return Usser(uid: user.uid);
  }

  // auth change user stream
  Stream<Usser> get user {
    // ignore: deprecated_member_use
    return _auth.onAuthStateChanged.map(_userFromFirebase);
    // .map((User user) => _userFromFirebase(user));
  }

  // TODO sign in anonymous
  // Future signInAnonymous() async {
  //   try {
  //     // AuthResult authResult = await _auth.signInAnonymously();
  //     // FirebaseUser user = authResult.user;
  //     UserCredential credential = await _auth.signInAnonymously();
  //     User user = credential.user;
  //     if (user != null) {
  //       return _userFromFirebase(user);
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

// TODO sign in with email and password

// TODO register with email and password
  Future registerWithEmailAndPassword(String email, String pwd) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: pwd);
      User user = credential.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // TODO sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
