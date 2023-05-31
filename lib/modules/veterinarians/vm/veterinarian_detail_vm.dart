import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:veterinarypratice/models/reservation_model.dart';
import 'package:veterinarypratice/services/reservation_service.dart';
part 'veterinarian_detail_vm.g.dart';

class VeterinarianDetailVM = VeterinarianDetailVMBase with _$VeterinarianDetailVM;

abstract class VeterinarianDetailVMBase with Store {
  @observable
  bool isLoading = false;
  @observable
  List<ReservationModel> reservations = [];
  @observable
  DateTime resDate = DateTime.now();
  @observable
  TimeOfDay resTime = TimeOfDay.now();

  @action
  void setReservations() {
    DateTime d = DateTime.now();
    TimeOfDay t = TimeOfDay.now();
    resDate = DateTime(d.year, d.month, d.day);
    resTime = TimeOfDay(hour: t.hour, minute: t.minute);
    reservations = ReservationService.reservationList;
  }

  @action
  Future addReservation(ReservationModel reservation) async {
    isLoading = true;
    await ReservationService.addReservation(reservation);
    isLoading = false;
  }
}
