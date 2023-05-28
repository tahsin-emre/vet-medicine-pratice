import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veterinarypratice/models/reservation_model.dart';

class ReservationService {
  static var db = FirebaseFirestore.instance;
  static List<ReservationModel> reservationList = [];

  static Future getReservations() async {
    var data = await db.collection('reservations').get();
    for (var element in data.docs) {
      reservationList.add(ReservationModel.fromQDS(element));
    }
  }

  static Future addReservation(ReservationModel reservation) async {
    var result = await db.collection('reservations').add({
      'customerId': reservation.customerId,
      'veterinarianId': reservation.veterinarianId,
      'animalId': reservation.animalId,
      'date': reservation.date,
    });
    reservation.id = result.id;
    reservationList.add(reservation);
  }
}
