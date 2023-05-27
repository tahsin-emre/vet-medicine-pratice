import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:veterinarypratice/modules/animals/view/animal_list_v.dart';
import 'package:veterinarypratice/modules/customers/view/customer_list_v.dart';
import 'package:veterinarypratice/modules/home/view/dashboard_v.dart';
import 'package:veterinarypratice/modules/home/vm/home_vm.dart';

class HomeView extends StatelessWidget {
  final HomeVM vm = HomeVM();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false),
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
    switch (vm.index) {
      case 0:
        return DashboardView();
      case 1:
        return CustomerListView();
      case 2:
        return AnimalListView();
      default:
        return Container();
    }
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