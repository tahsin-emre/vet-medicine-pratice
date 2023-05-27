// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_list_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AnimalListVM on AnimalListVMBase, Store {
  late final _$animalsAtom =
      Atom(name: 'AnimalListVMBase.animals', context: context);

  @override
  List<AnimalModel> get animals {
    _$animalsAtom.reportRead();
    return super.animals;
  }

  @override
  set animals(List<AnimalModel> value) {
    _$animalsAtom.reportWrite(value, super.animals, () {
      super.animals = value;
    });
  }

  late final _$AnimalListVMBaseActionController =
      ActionController(name: 'AnimalListVMBase', context: context);

  @override
  void setData() {
    final _$actionInfo = _$AnimalListVMBaseActionController.startAction(
        name: 'AnimalListVMBase.setData');
    try {
      return super.setData();
    } finally {
      _$AnimalListVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
animals: ${animals}
    ''';
  }
}
