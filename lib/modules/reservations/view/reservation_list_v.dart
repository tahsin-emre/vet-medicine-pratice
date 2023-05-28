import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:searchfield/searchfield.dart';
import 'package:veterinarypratice/extensions/cont_ext.dart';
import 'package:veterinarypratice/extensions/string_ext.dart';
import 'package:veterinarypratice/models/customer_model.dart';
import 'package:veterinarypratice/models/reservation_model.dart';
import 'package:veterinarypratice/modules/reservations/vm/reservation_list_vm.dart';
import 'package:veterinarypratice/services/animal_service.dart';
import 'package:veterinarypratice/services/customer_service.dart';
import 'package:veterinarypratice/services/veterinarian_service.dart';
import 'package:veterinarypratice/ui/mywid_loading.dart';

class ReservationListView extends StatelessWidget {
  final ReservationListVM vm = ReservationListVM();
  ReservationListView({super.key});

  @override
  Widget build(BuildContext context) {
    vm.setData();
    return Observer(builder: (_) {
      return Column(
        children: [
          queryText(),
          addReservation(context),
          vm.isLoading
              ? myWidLoading()
              : SingleChildScrollView(
                  child: Column(
                    children: [...vm.reservations.map((e) => reservationTile(context, e))],
                  ),
                ),
        ],
      );
    });
  }

  Widget reservationTile(BuildContext context, ReservationModel reservation) {
    return ListTile(
      onTap: () {},
      leading: const Icon(Icons.pets),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(
          '${reservation.customerId.toCustomer().name} || ${reservation.veterinarianId.toVeterinarian().name}'),
      subtitle: Text(reservation.date.toString().substring(0, 16)),
    );
  }

  Widget queryText() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: vm.cont,
              autofocus: false,
              onChanged: (value) => vm.query(value),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Write a animal or customer or veterinarian or type..',
                  prefixIcon: Icon(Icons.search, color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }

  Widget addReservation(BuildContext context) {
    TextEditingController customerCont = TextEditingController();
    TextEditingController veterinarianCont = TextEditingController();
    TextEditingController animalCont = TextEditingController();
    return ListTile(
      onTap: () async {
        await showDialog(
            context: context,
            builder: (diaCont) {
              return AlertDialog(
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      ReservationModel reservation = ReservationModel.fromUser(
                          customerCont.toCustomerId(),
                          veterinarianCont.toVeterinarianId(),
                          animalCont.toAnimalId(),
                          DateTime(vm.resDate.year, vm.resDate.month, vm.resDate.day,
                              vm.resTime.hour, vm.resTime.minute));
                      vm.addReservation(reservation);
                      Navigator.pop(diaCont);
                    },
                    child: const Text('Save'),
                  ),
                ],
                content: Observer(builder: (_) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: SearchField<CustomerModel>(
                          controller: customerCont,
                          searchInputDecoration: const InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Customer'),
                          suggestions: [
                            ...CustomerService.customerList.map((e) => SearchFieldListItem(e.name,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(e.name),
                                )))
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: SearchField<String>(
                          controller: veterinarianCont,
                          searchInputDecoration: const InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Veterinarian'),
                          suggestions: [
                            ...VeterinarianService.veterinarianList
                                .map((e) => SearchFieldListItem(e.name,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e.name),
                                    )))
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: SearchField<String>(
                          controller: animalCont,
                          searchInputDecoration: const InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Animal'),
                          suggestions: [
                            ...AnimalService.animalList.map((e) => SearchFieldListItem(e.name,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(e.name),
                                )))
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                              onPressed: () async {
                                DateTime? myDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100));
                                vm.resDate = myDate ?? DateTime(2000);
                              },
                              icon: const Icon(Icons.date_range),
                              label:
                                  Text('${vm.resDate.day}.${vm.resDate.month}.${vm.resDate.year}')),
                          TextButton.icon(
                              onPressed: () async {
                                TimeOfDay? myTime = await showTimePicker(
                                    builder: (BuildContext context, Widget? child) {
                                      return MediaQuery(
                                        data: MediaQuery.of(context)
                                            .copyWith(alwaysUse24HourFormat: true),
                                        child: child!,
                                      );
                                    },
                                    context: context,
                                    initialTime: TimeOfDay.now());
                                vm.resTime = myTime ?? const TimeOfDay(hour: 0, minute: 0);
                              },
                              icon: const Icon(Icons.watch_later),
                              label: Text('${vm.resTime.hour}:${vm.resTime.minute}')),
                        ],
                      )
                    ],
                  );
                }),
              );
            });
        vm.setData();
      },
      leading: const Icon(Icons.add),
      title: const Text('Add a Reservation'),
    );
  }
}
