import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:veterinarypratice/extensions/string_ext.dart';
import 'package:veterinarypratice/models/reservation_model.dart';

class ReservationDetailView extends StatelessWidget {
  final ReservationModel reservation;
  const ReservationDetailView(this.reservation, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Randevu Detayları')),
      body: ScreenTypeLayout.builder(
        mobile: (p0) => mobile(p0),
        desktop: (p0) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 900, child: mobile(p0)),
          ],
        ),
      ),
    );
  }

  Widget mobile(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Detaylar', style: TextStyle(fontSize: 20)),
          dataForm(reservation.id, 'ID'),
          dataForm(reservation.veterinarianId.toVeterinarian().name, 'Veteriner İsmi'),
          dataForm(reservation.customerId.toCustomer().name, 'Müşteri İsmi'),
          dataForm(reservation.animalId.toAnimal().name, 'Hayvan İsmi'),
        ],
      ),
    ));
  }

  Widget dataForm(String data, String label) {
    return Container(
      padding: const EdgeInsets.all(6),
      child: TextField(
        controller: TextEditingController(text: data),
        decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
        readOnly: true,
      ),
    );
  }
}
