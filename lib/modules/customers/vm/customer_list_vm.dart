import 'package:mobx/mobx.dart';
import 'package:veterinarypratice/models/customer_model.dart';
import 'package:veterinarypratice/services/customer_service.dart';
part 'customer_list_vm.g.dart';

class CustomerListVM = CustomerListVMBase with _$CustomerListVM;

abstract class CustomerListVMBase with Store {
  @observable
  List<CustomerModel> customers = [];

  @action
  void setData() {
    customers = CustomerService.customerList;
  }
}
