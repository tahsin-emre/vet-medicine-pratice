import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:veterinarypratice/enums/result.dart';
import 'package:veterinarypratice/services/animal_service.dart';
import 'package:veterinarypratice/services/auth_service.dart';
import 'package:veterinarypratice/services/customer_service.dart';
import 'package:veterinarypratice/services/reservation_service.dart';
import 'package:veterinarypratice/services/veterinarian_service.dart';
part 'login_vm.g.dart';

class LoginVM = LoginVMBase with _$LoginVM;

abstract class LoginVMBase with Store {
  @observable
  bool isLoading = false;
  @observable
  TextEditingController emailCont = TextEditingController(text: 'telli@tahsinemre.com');
  @observable
  TextEditingController passCont = TextEditingController(text: 'password');

  @action
  Future<Result> login() async {
    isLoading = true;
    Result result = await AuthService.login(emailCont.text, passCont.text);
    if (result == Result.okay) {
      await CustomerService.getCustomers();
      await AnimalService.getAnimals();
      await VeterinarianService.getVeterinarians();
      await ReservationService.getReservations();
    }
    isLoading = false;
    return result;
  }
}
