import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/screens/models/brew.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

      Future updateUserData(String sugars, String name, int strength) async {
        return await brewCollection.doc(uid).set({
          sugars: sugars,
          name: name,
          strength: strength
        });
}

// Brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    snapshot.docs.forEach((doc) {
    print('Fetched Brew: ${doc.data()}');
  });
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Brew(
        name: data['name'] ?? '',
        sugars: data['sugars'] ?? '0',
        strength: data['strength'] ?? 0,
      );
    }).toList();
  }

  // Get brews stream as List<Brew>
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}