import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:searchfield/searchfield.dart';
import 'package:veterinarypratice/extensions/cont_ext.dart';
import 'package:veterinarypratice/extensions/string_ext.dart';
import 'package:veterinarypratice/models/animal_model.dart';
import 'package:veterinarypratice/models/customer_model.dart';
import 'package:veterinarypratice/models/reservation_model.dart';
import 'package:veterinarypratice/modules/animals/vm/animal_detail_vm.dart';
import 'package:veterinarypratice/services/veterinarian_service.dart';
import 'package:veterinarypratice/ui/mywid_loading.dart';

class AnimalDetailView extends StatelessWidget {
  final AnimalDetailVM vm = AnimalDetailVM();
  final AnimalModel animal;
  AnimalDetailView(this.animal, {super.key});

  @override
  Widget build(BuildContext context) {
    vm.setReservations();
    return Scaffold(
      appBar: AppBar(title: const Text('Hayvan Detayları')),
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
      child: Observer(builder: (_) {
        return vm.isLoading
            ? myWidLoading()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Detaylar', style: TextStyle(fontSize: 20)),
                    dataForm(animal.id, 'ID'),
                    dataForm(animal.name, 'İsim'),
                    dataForm(animal.type, 'Tür'),
                    const Divider(),
                    customer(),
                    const Divider(),
                    reservations(_),
                  ],
                ),
              );
      }),
    );
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

  Widget customer() {
    CustomerModel owner = animal.customer;
    return Column(
      children: [
        const Text('Müşteri Bilgileri', style: TextStyle(fontSize: 20)),
        dataForm(owner.name, 'İsim'),
        dataForm(owner.phone, 'Telefon'),
        dataForm(owner.email, 'E-Mail'),
        dataForm(owner.citizenId, 'Kimlik No'),
      ],
    );
  }

  Widget reservations(BuildContext context) {
    return Column(
      children: [
        const Text('Randevular', style: TextStyle(fontSize: 20)),
        addReservation(context),
        ...vm.reservations
            .where((element) => element.animalId == animal.id)
            .map((e) => reservationTile(e)),
      ],
    );
  }

  Widget reservationTile(ReservationModel reservation) {
    return ListTile(
      title: Text(reservation.veterinarianId.toVeterinarian().name),
      trailing: Text(reservation.date.toString().substring(0, 16)),
    );
  }

  Widget addReservation(BuildContext context) {
    TextEditingController veterinarianCont = TextEditingController();
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
                          animal.ownerId,
                          veterinarianCont.toVeterinarianId(),
                          animal.id,
                          DateTime(vm.resDate.year, vm.resDate.month, vm.resDate.day,
                              vm.resTime.hour, vm.resTime.minute));
                      vm.addReservation(reservation);
                      Navigator.pop(diaCont);
                    },
                    child: const Text('Kaydet'),
                  ),
                ],
                content: Observer(builder: (_) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: SearchField<String>(
                          controller: veterinarianCont,
                          searchInputDecoration: const InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Veteriner'),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                              onPressed: () async {
                                DateTime? myDate = await showDatePicker(
                                    context: context,
                                    locale: const Locale('tr'),
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
        vm.setReservations();
      },
      leading: const Icon(Icons.add),
      title: const Text('Randevu Oluştur'),
    );
  }
}
