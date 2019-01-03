import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  CollectionReference getDataStream(String name) {
    return Firestore.instance.collection(name);
  }

  Stream getDataStreamSnapshot(String name) {
    return getDataStream(name).snapshots();
  }

  getObjectFromList(list, index) {
    return list[index];
  }

  updateData(collection, id, document) {
    Firestore.instance
        .collection(collection)
        .document(id)
        .updateData(document)
        .catchError((e) {
          print(e);
        });
  }

  deleteData(String collection, String id) {
    Firestore.instance
        .collection(collection)
        .document(id)
        .delete();
  }
}