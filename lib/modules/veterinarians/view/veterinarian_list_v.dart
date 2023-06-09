import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:veterinarypratice/models/veterinarian_model.dart';
import 'package:veterinarypratice/modules/veterinarians/view/veterinarian_detail_v.dart';
import 'package:veterinarypratice/modules/veterinarians/vm/veterinarian_list_vm.dart';
import 'package:veterinarypratice/ui/mywid_loading.dart';
import 'package:veterinarypratice/ui/mywid_tf.dart';

class VeterinarianListView extends StatelessWidget {
  final VeterinarianListVM vm = VeterinarianListVM();
  VeterinarianListView({super.key});

  @override
  Widget build(BuildContext context) {
    vm.setData();
    return Observer(builder: (_) {
      return SingleChildScrollView(
        child: Column(
          children: [
            queryText(),
            addVeterinarian(context),
            vm.isLoading
                ? myWidLoading()
                : Column(
                    children: [...vm.veterinarians.map((e) => veterinarianTile(context, e))],
                  ),
          ],
        ),
      );
    });
  }

  Widget veterinarianTile(BuildContext context, VeterinarianModel veterinarian) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (p0) => VeterinarianDetailView(veterinarian)));
      },
      leading: const Icon(Icons.person_4),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(veterinarian.name),
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
                  hintText: 'Write a name..',
                  prefixIcon: Icon(Icons.search, color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }

  Widget addVeterinarian(BuildContext context) {
    TextEditingController nameCont = TextEditingController();
    return ListTile(
      onTap: () async {
        await showDialog(
            context: context,
            builder: (diaCont) {
              return AlertDialog(
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      VeterinarianModel animal = VeterinarianModel.fromUser(nameCont.text);
                      vm.addVeterinarian(animal);
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
      title: const Text('Add a Veterinarian'),
    );
  }
}
