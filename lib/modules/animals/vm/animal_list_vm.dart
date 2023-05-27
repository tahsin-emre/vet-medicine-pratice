import 'package:mobx/mobx.dart';
import 'package:veterinarypratice/models/animal_model.dart';
import 'package:veterinarypratice/services/animal_service.dart';
part 'animal_list_vm.g.dart';

class AnimalListVM = AnimalListVMBase with _$AnimalListVM;

abstract class AnimalListVMBase with Store {
  @observable
  List<AnimalModel> animals = [];

  @action
  void setData() {
    animals = AnimalService.animalList;
  }
}
