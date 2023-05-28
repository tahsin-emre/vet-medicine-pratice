// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'veterinarian_list_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VeterinarianListVM on VeterinarianListVMBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'VeterinarianListVMBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$veterinariansAtom =
      Atom(name: 'VeterinarianListVMBase.veterinarians', context: context);

  @override
  List<VeterinarianModel> get veterinarians {
    _$veterinariansAtom.reportRead();
    return super.veterinarians;
  }

  @override
  set veterinarians(List<VeterinarianModel> value) {
    _$veterinariansAtom.reportWrite(value, super.veterinarians, () {
      super.veterinarians = value;
    });
  }

  late final _$contAtom =
      Atom(name: 'VeterinarianListVMBase.cont', context: context);

  @override
  TextEditingController get cont {
    _$contAtom.reportRead();
    return super.cont;
  }

  @override
  set cont(TextEditingController value) {
    _$contAtom.reportWrite(value, super.cont, () {
      super.cont = value;
    });
  }

  late final _$addVeterinarianAsyncAction =
      AsyncAction('VeterinarianListVMBase.addVeterinarian', context: context);

  @override
  Future<dynamic> addVeterinarian(VeterinarianModel model) {
    return _$addVeterinarianAsyncAction.run(() => super.addVeterinarian(model));
  }

  late final _$VeterinarianListVMBaseActionController =
      ActionController(name: 'VeterinarianListVMBase', context: context);

  @override
  void setData() {
    final _$actionInfo = _$VeterinarianListVMBaseActionController.startAction(
        name: 'VeterinarianListVMBase.setData');
    try {
      return super.setData();
    } finally {
      _$VeterinarianListVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void query(String query) {
    final _$actionInfo = _$VeterinarianListVMBaseActionController.startAction(
        name: 'VeterinarianListVMBase.query');
    try {
      return super.query(query);
    } finally {
      _$VeterinarianListVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
veterinarians: ${veterinarians},
cont: ${cont}
    ''';
  }
}
