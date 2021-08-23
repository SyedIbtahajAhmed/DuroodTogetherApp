import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:durood_together_app/Core/DataServices/API/appConst.dart';

class Api {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  // final String path;
  CollectionReference ref;
  // const static String durrodCountCollection = "DuroodCount";

  Api() {
    ref = _db.collection(AppConst.durrodCountCollection);
  }

  changePath(String collectionName) {
    ref = _db.collection(collectionName);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.get();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.doc(id).get();
  }

  Future<void> removeDocument(String id) {
    return ref.doc(id).delete();
  }

  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }

  Future<void> updateDocument(Map data, String id) {
    return ref.doc(id).update(data);
  }
}
