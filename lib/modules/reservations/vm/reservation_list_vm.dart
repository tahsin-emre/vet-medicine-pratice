import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:veterinarypratice/extensions/string_ext.dart';
import 'package:veterinarypratice/models/reservation_model.dart';
import 'package:veterinarypratice/services/reservation_service.dart';
part 'reservation_list_vm.g.dart';

class ReservationListVM = ReservationListVMBase with _$ReservationListVM;

abstract class ReservationListVMBase with Store {
  @observable
  bool isLoading = false;
  @observable
  List<ReservationModel> reservations = [];
  @observable
  TextEditingController cont = TextEditingController();
  @observable
  DateTime resDate = DateTime.now();
  @observable
  TimeOfDay resTime = TimeOfDay.now();

  @action
  void setData() {
    DateTime d = DateTime.now();
    TimeOfDay t = TimeOfDay.now();
    resDate = DateTime(d.year, d.month, d.day);
    resTime = TimeOfDay(hour: t.hour, minute: t.minute);
    reservations = ReservationService.reservationList;
  }

  @action
  void query(String query) {
    List<ReservationModel> temp = ReservationService.reservationList;
    if (query == '') {
      reservations = ReservationService.reservationList;
    } else {
      reservations = temp
          .where((element) =>
              ('${element.customerId.toCustomer().name.toLowerCase()} ${element.animalId.toAnimal().name.toLowerCase()} ${element.animalId.toAnimal().type.toLowerCase()} ${element.veterinarianId.toVeterinarian().name.toLowerCase()}')
                  .contains(query.toLowerCase()))
          .toList();
    }
  }

  @action
  Future addReservation(ReservationModel reservation) async {
    isLoading = true;
    await ReservationService.addReservation(reservation);
    isLoading = false;
  }
}
