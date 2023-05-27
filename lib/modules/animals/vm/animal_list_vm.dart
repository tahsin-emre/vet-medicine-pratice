import 'package:mobx/mobx.dart';
part 'animal_list_vm.g.dart';

class AnimalListVM = AnimalListVMBase with _$AnimalListVM;

abstract class AnimalListVMBase with Store {}
