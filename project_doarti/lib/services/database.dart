import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_doarti/models/doarti.dart';
import 'package:project_doarti/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  final CollectionReference doartiCollection = Firestore.instance.collection('doarti');

  Future<void> updateUserData(String books, String name) async {
    return await doartiCollection.document(uid).setData({
      'livros': books,
      'nome': name,
    });
  }

  List<Doarti> _doartiListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Doarti(
        name: doc.data['nome'] ?? '',
        books: doc.data['livros'] ?? '0'
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
      name: snapshot.data['nome'],
      books: snapshot.data['livros'],
    );
  }

  Stream<UserData> get userData {
    return doartiCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}