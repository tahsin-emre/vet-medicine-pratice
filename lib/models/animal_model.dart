import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veterinarypratice/extensions/string_ext.dart';
import 'package:veterinarypratice/models/customer_model.dart';

class AnimalModel {
  String id = '';
  String ownerId = '';
  String name = '';
  String type = '';
  CustomerModel customer = CustomerModel.none();

  AnimalModel.fromQDS(QueryDocumentSnapshot snapshot) {
    var data = snapshot.data() as dynamic;
    id = snapshot.id;
    ownerId = data['ownerId'] ?? '';
    name = data['name'] ?? '';
    type = data['type'] ?? '';
    customer = ownerId.toCustomer();
  }

  AnimalModel.fromUser(this.name, this.type, this.ownerId);

  AnimalModel.none() {
    name = 'Unregistered Animal';
  }
}
