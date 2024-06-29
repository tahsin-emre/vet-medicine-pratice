import 'package:cloud_firestore/cloud_firestore.dart';

class VeterinarianModel {
  String id = '';
  String name = '';

  VeterinarianModel.fromQDS(QueryDocumentSnapshot snapshot) {
    var data = snapshot.data() as dynamic;
    id = snapshot.id;
    name = data['name'];
  }

  VeterinarianModel.fromUser(this.name);
  VeterinarianModel.none() {
    name = 'Kayıtsız Veteriner';
  }
}
