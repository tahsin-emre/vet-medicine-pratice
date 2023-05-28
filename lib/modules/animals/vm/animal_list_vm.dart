import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:veterinarypratice/models/animal_model.dart';
import 'package:veterinarypratice/services/animal_service.dart';
part 'animal_list_vm.g.dart';

class AnimalListVM = AnimalListVMBase with _$AnimalListVM;

abstract class AnimalListVMBase with Store {
  @observable
  bool isLoading = false;
  @observable
  List<AnimalModel> animals = [];
  @observable
  TextEditingController cont = TextEditingController();

  @action
  void setData() {
    animals = AnimalService.animalList;
  }

  @action
  void query(String query) {
    List<AnimalModel> temp = AnimalService.animalList;
    if (query == '') {
      animals = AnimalService.animalList;
    } else {
      animals = temp
          .where((element) =>
              ('${element.name.toLowerCase()} ${element.customer.name.toLowerCase()} ${element.customer.phone.toString().toLowerCase()} ${element.type} ')
                  .contains(query.toLowerCase()))
          .toList();
    }
  }

  @action
  Future addAnimal(AnimalModel model) async {
    isLoading = true;
    await AnimalService.addAnimal(model);
    isLoading = false;
  }
}
