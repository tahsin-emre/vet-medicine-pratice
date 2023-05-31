// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginVM on LoginVMBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'LoginVMBase.isLoading', context: context);

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

  late final _$emailContAtom =
      Atom(name: 'LoginVMBase.emailCont', context: context);

  @override
  TextEditingController get emailCont {
    _$emailContAtom.reportRead();
    return super.emailCont;
  }

  @override
  set emailCont(TextEditingController value) {
    _$emailContAtom.reportWrite(value, super.emailCont, () {
      super.emailCont = value;
    });
  }

  late final _$passContAtom =
      Atom(name: 'LoginVMBase.passCont', context: context);

  @override
  TextEditingController get passCont {
    _$passContAtom.reportRead();
    return super.passCont;
  }

  @override
  set passCont(TextEditingController value) {
    _$passContAtom.reportWrite(value, super.passCont, () {
      super.passCont = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('LoginVMBase.login', context: context);

  @override
  Future<Result> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$LoginVMBaseActionController =
      ActionController(name: 'LoginVMBase', context: context);

  @override
  void getPrefs() {
    final _$actionInfo =
        _$LoginVMBaseActionController.startAction(name: 'LoginVMBase.getPrefs');
    try {
      return super.getPrefs();
    } finally {
      _$LoginVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
emailCont: ${emailCont},
passCont: ${passCont}
    ''';
  }
}
