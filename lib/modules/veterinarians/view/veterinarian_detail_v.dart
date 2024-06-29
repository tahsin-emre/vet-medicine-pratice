import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:searchfield/searchfield.dart';
import 'package:veterinarypratice/extensions/cont_ext.dart';
import 'package:veterinarypratice/extensions/string_ext.dart';
import 'package:veterinarypratice/models/customer_model.dart';
import 'package:veterinarypratice/models/reservation_model.dart';
import 'package:veterinarypratice/models/veterinarian_model.dart';
import 'package:veterinarypratice/modules/veterinarians/vm/veterinarian_detail_vm.dart';
import 'package:veterinarypratice/services/animal_service.dart';
import 'package:veterinarypratice/services/customer_service.dart';
import 'package:veterinarypratice/ui/mywid_loading.dart';

class VeterinarianDetailView extends StatelessWidget {
  final VeterinarianDetailVM vm = VeterinarianDetailVM();
  final VeterinarianModel veterinarian;
  VeterinarianDetailView(this.veterinarian, {super.key});

  @override
  Widget build(BuildContext context) {
    vm.setReservations();
    return Scaffold(
      appBar: AppBar(title: const Text('Veteriner Detayları')),
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
                    dataForm(veterinarian.id, 'ID'),
                    dataForm(veterinarian.name, 'İsim'),
                    const Divider(),
                    reservations(context),
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

  Widget reservations(BuildContext context) {
    return Column(
      children: [
        const Text('Randevular', style: TextStyle(fontSize: 20)),
        addReservation(context),
        ...vm.reservations
            .where((element) => element.veterinarianId == veterinarian.id)
            .map((e) => reservationTile(e)),
      ],
    );
  }

  Widget reservationTile(ReservationModel reservation) {
    return ListTile(
      title: Text(reservation.customerId.toCustomer().name),
      subtitle: Text(reservation.animalId.toAnimal().name),
      trailing: Text(reservation.date.toString().substring(0, 16)),
    );
  }

  Widget addReservation(BuildContext context) {
    TextEditingController customerCont = TextEditingController();
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
                          veterinarian.id,
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
                        child: SearchField<CustomerModel>(
                          controller: customerCont,
                          searchInputDecoration: const InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Müşteri'),
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
                          controller: animalCont,
                          searchInputDecoration: const InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Hayvan'),
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
                                    locale: const Locale('tr'),
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
