import 'package:flutter/material.dart';
import 'package:veterinarypratice/modules/home/vm/dashboard_vm.dart';
import 'package:veterinarypratice/services/animal_service.dart';
import 'package:veterinarypratice/services/customer_service.dart';
import 'package:veterinarypratice/services/reservation_service.dart';
import 'package:veterinarypratice/services/veterinarian_service.dart';

class DashboardView extends StatelessWidget {
  final DashboardVM vm = DashboardVM();
  DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: detailBox('Customers', CustomerService.customerList.length),
            ),
            Expanded(
              child: detailBox('Animals', AnimalService.animalList.length),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: detailBox('Veterinarians', VeterinarianService.veterinarianList.length),
            ),
            Expanded(
              child: detailBox('Reservations', ReservationService.reservationList.length),
            )
          ],
        ),
      ],
    );
  }

  Widget detailBox(String label, int value) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)), color: Colors.grey.shade400),
      height: 200,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: Colors.green.shade800,
            ),
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            height: 40,
            child: Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                value.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
