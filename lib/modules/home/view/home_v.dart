import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:veterinarypratice/modules/animals/view/animal_list_v.dart';
import 'package:veterinarypratice/modules/auth/view/login_v.dart';
import 'package:veterinarypratice/modules/customers/view/customer_list_v.dart';
import 'package:veterinarypratice/modules/home/view/dashboard_v.dart';
import 'package:veterinarypratice/modules/home/vm/home_vm.dart';
import 'package:veterinarypratice/modules/reservations/view/reservation_list_v.dart';
import 'package:veterinarypratice/modules/veterinarians/view/veterinarian_list_v.dart';
import 'package:veterinarypratice/services/auth_service.dart';

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
            Expanded(child: navRail()),
            SizedBox(width: 1050, child: mobile(context)),
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
      child: navRail(),
    );
  }

  Widget navRail() {
    return Observer(builder: (_) {
      return NavigationRail(
        onDestinationSelected: (value) => vm.index = value,
        useIndicator: true,
        extended: true,
        destinations: [
          navRailTile('Dashboard', Icons.dashboard),
          navRailTile('Customers', Icons.people),
          navRailTile('Animals', Icons.pets),
          navRailTile('Veterinarians', Icons.health_and_safety),
          navRailTile('Reservations', Icons.calendar_month),
        ],
        trailing: ElevatedButton.icon(
            icon: const Icon(Icons.power_settings_new),
            onPressed: () async {
              AuthService.logout().then((value) => Navigator.pushAndRemoveUntil(
                  _, MaterialPageRoute(builder: (cont) => LoginView()), (route) => false));
            },
            label: const Text('Logout')),
        selectedIndex: vm.index,
      );
    });
  }

  NavigationRailDestination navRailTile(String label, IconData icon) {
    return NavigationRailDestination(
      selectedIcon: Icon(icon, color: Colors.black),
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
