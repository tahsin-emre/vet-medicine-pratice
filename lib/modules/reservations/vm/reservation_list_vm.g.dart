// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_list_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReservationListVM on ReservationListVMBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'ReservationListVMBase.isLoading', context: context);

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

  late final _$reservationsAtom =
      Atom(name: 'ReservationListVMBase.reservations', context: context);

  @override
  List<ReservationModel> get reservations {
    _$reservationsAtom.reportRead();
    return super.reservations;
  }

  @override
  set reservations(List<ReservationModel> value) {
    _$reservationsAtom.reportWrite(value, super.reservations, () {
      super.reservations = value;
    });
  }

  late final _$contAtom =
      Atom(name: 'ReservationListVMBase.cont', context: context);

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

  late final _$resDateAtom =
      Atom(name: 'ReservationListVMBase.resDate', context: context);

  @override
  DateTime get resDate {
    _$resDateAtom.reportRead();
    return super.resDate;
  }

  @override
  set resDate(DateTime value) {
    _$resDateAtom.reportWrite(value, super.resDate, () {
      super.resDate = value;
    });
  }

  late final _$resTimeAtom =
      Atom(name: 'ReservationListVMBase.resTime', context: context);

  @override
  TimeOfDay get resTime {
    _$resTimeAtom.reportRead();
    return super.resTime;
  }

  @override
  set resTime(TimeOfDay value) {
    _$resTimeAtom.reportWrite(value, super.resTime, () {
      super.resTime = value;
    });
  }

  late final _$addReservationAsyncAction =
      AsyncAction('ReservationListVMBase.addReservation', context: context);

  @override
  Future<dynamic> addReservation(ReservationModel reservation) {
    return _$addReservationAsyncAction
        .run(() => super.addReservation(reservation));
  }

  late final _$ReservationListVMBaseActionController =
      ActionController(name: 'ReservationListVMBase', context: context);

  @override
  void setData() {
    final _$actionInfo = _$ReservationListVMBaseActionController.startAction(
        name: 'ReservationListVMBase.setData');
    try {
      return super.setData();
    } finally {
      _$ReservationListVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void query(String query) {
    final _$actionInfo = _$ReservationListVMBaseActionController.startAction(
        name: 'ReservationListVMBase.query');
    try {
      return super.query(query);
    } finally {
      _$ReservationListVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
reservations: ${reservations},
cont: ${cont},
resDate: ${resDate},
resTime: ${resTime}
    ''';
  }
}
