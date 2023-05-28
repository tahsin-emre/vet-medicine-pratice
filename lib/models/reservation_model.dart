import 'package:cloud_firestore/cloud_firestore.dart';

class ReservationModel {
  String id = '';
  String customerId = '';
  String veterinarianId = '';
  String animalId = '';
  DateTime date = DateTime(2000);

  ReservationModel.fromQDS(QueryDocumentSnapshot snapshot) {
    var data = snapshot.data() as dynamic;
    id = snapshot.id;
    customerId = data['customerId'] ?? '';
    veterinarianId = data['veterinarianId'] ?? '';
    animalId = data['animalId'] ?? '';
    date = (data['date'] as Timestamp?)?.toDate() ?? DateTime(2000);
  }

  ReservationModel.fromUser(this.customerId, this.veterinarianId, this.animalId, this.date);
}
