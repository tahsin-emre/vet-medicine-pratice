import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:veterinarypratice/models/veterinarian_model.dart';
import 'package:veterinarypratice/services/veterinarian_service.dart';
part 'veterinarian_list_vm.g.dart';

class VeterinarianListVM = VeterinarianListVMBase with _$VeterinarianListVM;

abstract class VeterinarianListVMBase with Store {
  @observable
  bool isLoading = false;
  @observable
  List<VeterinarianModel> veterinarians = [];
  @observable
  TextEditingController cont = TextEditingController();

  @action
  void setData() {
    veterinarians = VeterinarianService.veterinarianList;
  }

  @action
  void query(String query) {
    List<VeterinarianModel> temp = VeterinarianService.veterinarianList;
    if (query == '') {
      veterinarians = VeterinarianService.veterinarianList;
    } else {
      veterinarians = temp
          .where((element) => (element.name.toLowerCase()).contains(query.toLowerCase()))
          .toList();
    }
  }

  @action
  Future addVeterinarian(VeterinarianModel model) async {
    isLoading = true;
    await VeterinarianService.addVeterinarian(model);
    isLoading = false;
  }
}
