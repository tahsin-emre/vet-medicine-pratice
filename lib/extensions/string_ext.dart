import 'package:veterinarypratice/models/animal_model.dart';
import 'package:veterinarypratice/models/customer_model.dart';
import 'package:veterinarypratice/models/veterinarian_model.dart';
import 'package:veterinarypratice/services/animal_service.dart';
import 'package:veterinarypratice/services/customer_service.dart';
import 'package:veterinarypratice/services/veterinarian_service.dart';

extension StringExt on String {
  CustomerModel toCustomer() {
    return CustomerService.customerList.where((element) => element.id == this).isEmpty
        ? CustomerModel.none()
        : CustomerService.customerList.where((element) => element.id == this).first;
  }

  AnimalModel toAnimal() {
    return AnimalService.animalList.where((element) => element.id == this).isEmpty
        ? AnimalModel.none()
        : AnimalService.animalList.where((element) => element.id == this).first;
  }

  VeterinarianModel toVeterinarian() {
    return VeterinarianService.veterinarianList.where((element) => element.id == this).isEmpty
        ? VeterinarianModel.none()
        : VeterinarianService.veterinarianList.where((element) => element.id == this).first;
  }
}
