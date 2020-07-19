import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_doarti/models/doarti.dart';
import 'package:project_doarti/models/user.dart';

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

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugars: snapshot.data['sugars'],
      strength: snapshot.data['strength']
    );
  }

  Stream<UserData> get userData {
    return doartiCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}