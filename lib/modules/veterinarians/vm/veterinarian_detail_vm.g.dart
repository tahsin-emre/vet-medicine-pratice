// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'veterinarian_detail_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VeterinarianDetailVM on VeterinarianDetailVMBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'VeterinarianDetailVMBase.isLoading', context: context);

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
      Atom(name: 'VeterinarianDetailVMBase.reservations', context: context);

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

  late final _$resDateAtom =
      Atom(name: 'VeterinarianDetailVMBase.resDate', context: context);

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
      Atom(name: 'VeterinarianDetailVMBase.resTime', context: context);

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
      AsyncAction('VeterinarianDetailVMBase.addReservation', context: context);

  @override
  Future<dynamic> addReservation(ReservationModel reservation) {
    return _$addReservationAsyncAction
        .run(() => super.addReservation(reservation));
  }

  late final _$VeterinarianDetailVMBaseActionController =
      ActionController(name: 'VeterinarianDetailVMBase', context: context);

  @override
  void setReservations() {
    final _$actionInfo = _$VeterinarianDetailVMBaseActionController.startAction(
        name: 'VeterinarianDetailVMBase.setReservations');
    try {
      return super.setReservations();
    } finally {
      _$VeterinarianDetailVMBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
reservations: ${reservations},
resDate: ${resDate},
resTime: ${resTime}
    ''';
  }
}
