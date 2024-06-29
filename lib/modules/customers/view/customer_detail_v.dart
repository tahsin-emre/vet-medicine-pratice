import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:searchfield/searchfield.dart';
import 'package:veterinarypratice/constants/animal_types.dart';
import 'package:veterinarypratice/extensions/cont_ext.dart';
import 'package:veterinarypratice/extensions/string_ext.dart';
import 'package:veterinarypratice/models/animal_model.dart';
import 'package:veterinarypratice/models/customer_model.dart';
import 'package:veterinarypratice/models/reservation_model.dart';
import 'package:veterinarypratice/modules/customers/vm/customer_detail_vm.dart';
import 'package:veterinarypratice/services/animal_service.dart';
import 'package:veterinarypratice/services/veterinarian_service.dart';
import 'package:veterinarypratice/ui/mywid_loading.dart';
import 'package:veterinarypratice/ui/mywid_tf.dart';

class CustomerDetailView extends StatelessWidget {
  final CustomerDetailVM vm = CustomerDetailVM();
  final CustomerModel customer;
  CustomerDetailView(this.customer, {super.key});

  @override
  Widget build(BuildContext context) {
    vm.setAnimals();
    vm.setReservations();
    return Scaffold(
      appBar: AppBar(title: const Text('Müşteri Detayları')),
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
                    dataForm(customer.id, 'ID'),
                    dataForm(customer.name, 'İsim'),
                    dataForm(customer.phone, 'Telefon'),
                    dataForm(customer.email, 'E-Mail'),
                    dataForm(customer.citizenId, 'Kimlik No'),
                    const Divider(),
                    animals(_),
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

  Widget animals(BuildContext context) {
    return Column(
      children: [
        const Text('Hayvanlar', style: TextStyle(fontSize: 20)),
        addAnimal(context),
        ...vm.animals.where((element) => element.ownerId == customer.id).map((e) => animalTile(e)),
      ],
    );
  }

  Widget animalTile(AnimalModel animal) {
    return ListTile(
      title: Text(animal.name),
      subtitle: Text(animal.type),
    );
  }

  Widget addAnimal(BuildContext context) {
    TextEditingController nameCont = TextEditingController();
    TextEditingController typeCont = TextEditingController();
    return ListTile(
      onTap: () async {
        await showDialog(
            context: context,
            builder: (diaCont) {
              return AlertDialog(
                actions: [
                  ElevatedButton(
                    onPressed: () async {
                      AnimalModel animal =
                          AnimalModel.fromUser(nameCont.text, typeCont.text, customer.id);
                      await vm.addAnimal(animal).then((value) => Navigator.pop(diaCont));
                    },
                    child: const Text('Kaydet'),
                  ),
                ],
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    myWidTF(nameCont, 'İsim'),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: SearchField<String>(
                        controller: typeCont,
                        searchInputDecoration:
                            const InputDecoration(border: OutlineInputBorder(), labelText: 'Tür'),
                        suggestions: [
                          ...animalTypes.map((e) => SearchFieldListItem(e,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(e),
                              )))
                        ],
                      ),
                    ),
                  ],
                ),
              );
            });
        vm.setAnimals();
      },
      leading: const Icon(Icons.add),
      title: const Text('Hayvan Ekle'),
    );
  }

  Widget reservations(BuildContext context) {
    return Column(
      children: [
        const Text('Randevular', style: TextStyle(fontSize: 20)),
        addReservation(context),
        ...vm.reservations
            .where((element) => element.customerId == customer.id)
            .map((e) => reservationTile(e)),
      ],
    );
  }

  Widget reservationTile(ReservationModel reservation) {
    return ListTile(
      title: Text(reservation.animalId.toAnimal().name),
      trailing: Text(reservation.date.toString().substring(0, 16)),
      subtitle: Text(reservation.veterinarianId.toVeterinarian().name),
    );
  }

  Widget addReservation(BuildContext context) {
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
                          customer.id,
                          veterinarianCont.toVeterinarianId(),
                          animalCont.toAnimalId(),
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
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        child: SearchField<String>(
                          controller: animalCont,
                          searchInputDecoration: const InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Hayvan'),
                          suggestions: [
                            ...AnimalService.animalList
                                .where((element) => element.ownerId == customer.id)
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
