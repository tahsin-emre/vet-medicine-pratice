import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerModel {
  String id = '';
  String name = '';
  String phone = '';
  String email = '';
  String citizenId = '';

  CustomerModel.fromQDS(QueryDocumentSnapshot snapshot) {
    var data = snapshot.data() as dynamic;
    id = snapshot.id;
    name = data['name'] ?? '';
    phone = data['phone'] ?? '';
    email = data['email'] ?? '';
    citizenId = data['citizenId'] ?? '';
  }
}
