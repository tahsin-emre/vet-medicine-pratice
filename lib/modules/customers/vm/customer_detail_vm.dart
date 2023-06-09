import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:veterinarypratice/models/animal_model.dart';
import 'package:veterinarypratice/models/reservation_model.dart';
import 'package:veterinarypratice/services/animal_service.dart';
import 'package:veterinarypratice/services/reservation_service.dart';
part 'customer_detail_vm.g.dart';

class CustomerDetailVM = CustomerDetailVMBase with _$CustomerDetailVM;

abstract class CustomerDetailVMBase with Store {
  @observable
  bool isLoading = false;
  @observable
  List<AnimalModel> animals = [];
  @observable
  List<ReservationModel> reservations = [];
  @observable
  DateTime resDate = DateTime.now();
  @observable
  TimeOfDay resTime = TimeOfDay.now();

  @action
  void setAnimals() {
    animals = AnimalService.animalList;
  }

  @action
  void setReservations() {
    DateTime d = DateTime.now();
    TimeOfDay t = TimeOfDay.now();
    resDate = DateTime(d.year, d.month, d.day);
    resTime = TimeOfDay(hour: t.hour, minute: t.minute);
    reservations = ReservationService.reservationList;
  }

  @action
  Future addAnimal(AnimalModel model) async {
    isLoading = true;
    await AnimalService.addAnimal(model);
    isLoading = false;
  }

  @action
  Future addReservation(ReservationModel reservation) async {
    isLoading = true;
    await ReservationService.addReservation(reservation);
    isLoading = false;
  }
}
