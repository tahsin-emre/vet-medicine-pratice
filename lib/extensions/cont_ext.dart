import 'package:flutter/material.dart';
import 'package:veterinarypratice/services/customer_service.dart';

extension ContExt on TextEditingController {
  String toCustomerId() {
    return CustomerService.customerList.where((element) => element.name == text).first.id;
  }
}
