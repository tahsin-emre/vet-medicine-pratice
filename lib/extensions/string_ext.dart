import 'package:veterinarypratice/models/customer_model.dart';
import 'package:veterinarypratice/services/customer_service.dart';

extension StringExt on String {
  CustomerModel toCustomer() {
    return CustomerService.customerList.where((element) => element.id == this).isEmpty
        ? CustomerModel.none()
        : CustomerService.customerList.where((element) => element.id == this).first;
  }
}
