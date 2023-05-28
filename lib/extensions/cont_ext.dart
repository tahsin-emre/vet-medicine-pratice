import 'package:flutter/material.dart';
import 'package:veterinarypratice/services/animal_service.dart';
import 'package:veterinarypratice/services/customer_service.dart';
import 'package:veterinarypratice/services/veterinarian_service.dart';

extension ContExt on TextEditingController {
  String toCustomerId() {
    return CustomerService.customerList.where((element) => element.name == text).first.id;
  }

  String toVeterinarianId() {
    return VeterinarianService.veterinarianList.where((element) => element.name == text).first.id;
  }

  String toAnimalId() {
    return AnimalService.animalList.where((element) => element.name == text).first.id;
  }
}
