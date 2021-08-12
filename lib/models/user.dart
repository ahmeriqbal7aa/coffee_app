class Usser {
  final String uid;
  Usser({this.uid});
}

// purpose of above class is actually
// to turn Firebase_User_Obj into a
// user_obj based on this class
// so we turn FirebaseUser's obj--> "user" into our CustomUser's obj--> "uid"

// ======================== //
// user data model
class UserData {
  final String uid;
  final String name;
  final String sugars;
  final String strength;
  UserData({this.uid, this.name, this.sugars, this.strength});
}
