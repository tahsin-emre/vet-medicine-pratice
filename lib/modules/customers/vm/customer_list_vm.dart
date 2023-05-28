import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:veterinarypratice/models/customer_model.dart';
import 'package:veterinarypratice/services/customer_service.dart';
part 'customer_list_vm.g.dart';

class CustomerListVM = CustomerListVMBase with _$CustomerListVM;

abstract class CustomerListVMBase with Store {
  @observable
  bool isLoading = false;
  @observable
  List<CustomerModel> customers = [];
  @observable
  TextEditingController cont = TextEditingController();

  @action
  void setData() {
    customers = CustomerService.customerList;
  }

  @action
  void query(String query) {
    List<CustomerModel> temp = CustomerService.customerList;
    if (query == '') {
      customers = CustomerService.customerList;
    } else {
      customers = temp
          .where((element) =>
              ('${element.name.toLowerCase()} ${element.email.toLowerCase()} ${element.phone.toString().toLowerCase()} ')
                  .contains(query.toLowerCase()))
          .toList();
    }
  }

  @action
  Future addCustomer(CustomerModel model) async {
    isLoading = true;
    await CustomerService.addCustomer(model);
    isLoading = false;
  }
}
