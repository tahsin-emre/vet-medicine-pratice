import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:veterinarypratice/modules/animals/view/animal_list_v.dart';
import 'package:veterinarypratice/modules/customers/view/customer_list_v.dart';
import 'package:veterinarypratice/modules/home/view/dashboard_v.dart';
import 'package:veterinarypratice/modules/home/vm/home_vm.dart';
import 'package:veterinarypratice/modules/reservations/view/reservation_list_v.dart';
import 'package:veterinarypratice/modules/veterinarians/view/veterinarian_list_v.dart';

class HomeView extends StatelessWidget {
  final HomeVM vm = HomeVM();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Mock-Up Veterinary Medicine'),
      ),
      drawer: ScreenTypeLayout.builder(
        mobile: (p0) => drawer(),
      ),
      body: ScreenTypeLayout.builder(
        mobile: (context) => mobile(context),
        desktop: (context) => Row(
          children: [
            Expanded(child: rail()),
            SizedBox(width: 900, child: mobile(context)),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

  Widget mobile(BuildContext context) {
    return Observer(builder: (context) {
      switch (vm.index) {
        case 0:
          return DashboardView();
        case 1:
          return CustomerListView();
        case 2:
          return AnimalListView();
        case 3:
          return VeterinarianListView();
        case 4:
          return ReservationListView();
        default:
          return Container();
      }
    });
  }

  Widget drawer() {
    return Drawer(
      child: rail(),
    );
  }

  Widget rail() {
    return Observer(builder: (_) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            railTile(0, Icons.dashboard, 'Dashboard'),
            railTile(1, Icons.people, 'Customers'),
            railTile(2, Icons.pets, 'Animals'),
            railTile(3, Icons.health_and_safety, 'Veterinarians'),
            railTile(4, Icons.calendar_month, 'Reservations'),
          ],
        ),
      );
    });
  }

  Widget railTile(int index, IconData icon, String label) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: TextButton.icon(
        style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(vm.index == index ? Colors.blue : Colors.black),
        ),
        onPressed: () => vm.index = index,
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}
