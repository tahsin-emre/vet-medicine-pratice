import 'package:mobx/mobx.dart';
part 'customer_list_vm.g.dart';

class CustomerListVM = CustomerListVMBase with _$CustomerListVM;

abstract class CustomerListVMBase with Store {}
