import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final FirestoreService instance = FirestoreService();

  String get userId => FirebaseAuth.instance.currentUser?.uid ?? "";

  late Map<String, CollectionReference> collection = {
    'users-response': firestore.collection("users-response"),
    'posts': firestore.collection("posts"),
  };

  Future getDocumentById(String collectionName, String id) async {
    DocumentSnapshot<Object?> ref =
        await collection[collectionName]!.doc(id).get();
    return ref.data();
  }

  Future<String> addDocument(
      String collectionName, Map<String, dynamic> body) async {
    DocumentReference<Object?> ref =
        await collection[collectionName]!.add(body);
    return ref.id;
  }

  CollectionReference? getCollectionReferenceById(String collectionName) {
    return collection[collectionName];
  }

  DocumentReference? getDocumentReferenceById(
      String collectionName, String id) {
    if (collection[collectionName] == null) {
      return null;
    } else {
      return collection[collectionName]!.doc(id);
    }
  }
}
