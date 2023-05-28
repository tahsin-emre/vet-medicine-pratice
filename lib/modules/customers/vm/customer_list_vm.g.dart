// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_list_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomerListVM on CustomerListVMBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'CustomerListVMBase.isLoading', context: context);

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

  late final _$customersAtom =
      Atom(name: 'CustomerListVMBase.customers', context: context);

  @override
  List<CustomerModel> get customers {
    _$customersAtom.reportRead();
    return super.customers;
  }

  @override
  set customers(List<CustomerModel> value) {
    _$customersAtom.reportWrite(value, super.customers, () {
      super.customers = value;
    });
  }

  late final _$contAtom =
      Atom(name: 'CustomerListVMBase.cont', context: context);

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

  late final _$addCustomerAsyncAction =
      AsyncAction('CustomerListVMBase.addCustomer', context: context);

  @override
  Future<dynamic> addCustomer(CustomerModel model) {
    return _$addCustomerAsyncAction.run(() => super.addCustomer(model));
  }

  late final _$CustomerListVMBaseActionController =
      ActionController(name: 'CustomerListVMBase', context: context);

  @override
  void setData() {
    final _$actionInfo = _$CustomerListVMBaseActionController.startAction(
        name: 'CustomerListVMBase.setData');
    try {
      return super.setData();
    } finally {
      _$CustomerListVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void query(String query) {
    final _$actionInfo = _$CustomerListVMBaseActionController.startAction(
        name: 'CustomerListVMBase.query');
    try {
      return super.query(query);
    } finally {
      _$CustomerListVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
customers: ${customers},
cont: ${cont}
    ''';
  }
}
