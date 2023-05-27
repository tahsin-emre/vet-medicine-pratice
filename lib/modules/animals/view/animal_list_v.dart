import 'package:flutter/material.dart';
import 'package:veterinarypratice/models/animal_model.dart';
import 'package:veterinarypratice/modules/animals/vm/animal_list_vm.dart';

class AnimalListView extends StatelessWidget {
  final AnimalListVM vm = AnimalListVM();
  AnimalListView({super.key});

  @override
  Widget build(BuildContext context) {
    vm.setData();
    return Column(
      children: [...vm.animals.map((e) => animalTile(context, e))],
    );
  }

  Widget animalTile(BuildContext context, AnimalModel animal) {
    return ListTile(
      onTap: () {},
      leading: const Icon(Icons.pets),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(animal.name),
      subtitle: Text(animal.customer.name),
    );
  }
}
