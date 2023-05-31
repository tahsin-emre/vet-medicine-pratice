import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id = '';
  String email = '';
  String name = '';

  UserModel.fromDS(DocumentSnapshot snapshot) {
    var data = snapshot.data() as dynamic;
    id = snapshot.id;
    email = data['email'] ?? '';
    name = data['name'] ?? '';
  }

  UserModel.logout() {
    id = '';
    email = '';
    name = '';
  }
}
