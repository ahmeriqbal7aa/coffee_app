class Brew {
  final String name;
  final String sugars;
  final String strength;
  Brew({this.name, this.sugars, this.strength});
}

// purpose of above class is actually
// to turn Firebase_User_Obj into a
// user_obj based on this class
// so we turn FirebaseUser's obj--> "user" into our CustomUser's obj--> "uid"
