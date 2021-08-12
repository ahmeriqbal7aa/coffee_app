import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/models/brew.dart';
import 'package:coffee_app/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // TODO collection reference
  final CollectionReference coffeeCollection =
      FirebaseFirestore.instance.collection('coffee');

  Future<void> updateUserData(
      String sugars, String name, String strength) async {
    return await coffeeCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // TODO brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      // print(doc.data);
      return Brew(
        // "??" mean if name doesn't exit then we'll return an empty string
        name: doc.data()['name'] ?? "",
        strength: doc.data()["strength"] ?? 0,
        sugars: doc.data()["sugars"] ?? "0",
      );
      // this return not a list but iterable
      // to convert to list we use "toList()"
    }).toList();
  }

  // TODO user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data()["name"].toString(),
        sugars: snapshot.data()['sugars'].toString(),
        strength: snapshot.data()['strength'].toString());
  }

  // TODO get coffee stream
  // Stream<QuerySnapshot>
  Stream<List<Brew>> get coffeeSnapshot {
    return coffeeCollection.snapshots().map(_brewListFromSnapshot);
  }

  // TODO get user doc stream
  // Stream<DocumentSnapshot> get userData
  Stream<UserData> get userData {
    return coffeeCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
