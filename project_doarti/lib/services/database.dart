import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_doarti/models/doarti.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  final CollectionReference doartiCollection = Firestore.instance.collection('doarti');

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await doartiCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  List<Doarti> _doartiListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Doarti(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0'
      );
    }).toList();
  }

  Stream<List<Doarti>> get doarti {
  	return doartiCollection.snapshots()
  	.map(_doartiListFromSnapshot);
  }

}