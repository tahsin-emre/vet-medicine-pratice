import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:veterinarypratice/models/animal_model.dart';
import 'package:veterinarypratice/modules/animals/vm/animal_list_vm.dart';
import 'package:veterinarypratice/ui/mywid_loading.dart';
import 'package:veterinarypratice/ui/mywid_tf.dart';

class AnimalListView extends StatelessWidget {
  final AnimalListVM vm = AnimalListVM();
  AnimalListView({super.key});

  @override
  Widget build(BuildContext context) {
    vm.setData();
    return Observer(builder: (_) {
      return Column(
        children: [
          queryText(),
          addAnimal(context),
          vm.isLoading
              ? myWidLoading()
              : SingleChildScrollView(
                  child: Column(
                    children: [...vm.animals.map((e) => animalTile(context, e))],
                  ),
                ),
        ],
      );
    });
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
                  hintText: 'Write a name or customer..',
                  prefixIcon: Icon(Icons.search, color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }

  Widget addAnimal(BuildContext context) {
    TextEditingController nameCont = TextEditingController();
    TextEditingController ownerCont = TextEditingController();
    TextEditingController typeCont = TextEditingController();
    return ListTile(
      onTap: () async {
        await showDialog(
            context: context,
            builder: (diaCont) {
              return AlertDialog(
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      AnimalModel animal = AnimalModel.fromUser(
                        nameCont.text,
                        ownerCont.text,
                        typeCont.text,
                      );
                      vm.addAnimal(animal);
                      Navigator.pop(diaCont);
                    },
                    child: const Text('Save'),
                  ),
                ],
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    myWidTF(nameCont, 'Name'),
                  ],
                ),
              );
            });
        vm.setData();
      },
      leading: const Icon(Icons.add),
      title: const Text('Add an Animal'),
    );
  }
}
