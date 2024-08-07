import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:veterinarypratice/models/customer_model.dart';
import 'package:veterinarypratice/modules/customers/view/customer_detail_v.dart';
import 'package:veterinarypratice/modules/customers/vm/customer_list_vm.dart';
import 'package:veterinarypratice/ui/mywid_loading.dart';
import 'package:veterinarypratice/ui/mywid_tf.dart';

class CustomerListView extends StatelessWidget {
  final CustomerListVM vm = CustomerListVM();
  CustomerListView({super.key});

  @override
  Widget build(BuildContext context) {
    vm.setData();
    return Observer(builder: (_) {
      return Column(
        children: [
          queryText(),
          addCustomer(context),
          vm.isLoading
              ? myWidLoading()
              : Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [...vm.customers.map((e) => customerTile(context, e))],
                    ),
                  ),
                ),
        ],
      );
    });
  }

  Widget customerTile(BuildContext context, CustomerModel customer) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CustomerDetailView(customer)));
      },
      leading: const Icon(Icons.person),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(customer.name),
      subtitle: Text(customer.phone),
    );
  }

  Widget addCustomer(BuildContext context) {
    TextEditingController nameCont = TextEditingController();
    TextEditingController phoneCont = TextEditingController();
    TextEditingController citizenCont = TextEditingController();
    TextEditingController emailCont = TextEditingController();
    return ListTile(
      onTap: () async {
        await showDialog(
            context: context,
            builder: (diaCont) {
              return AlertDialog(
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      CustomerModel customer = CustomerModel.fromUser(
                        nameCont.text,
                        phoneCont.text,
                        emailCont.text,
                        citizenCont.text,
                      );
                      vm.addCustomer(customer);
                      Navigator.pop(diaCont);
                    },
                    child: const Text('Kaydet'),
                  ),
                ],
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    myWidTF(nameCont, 'İsim'),
                    myWidTF(phoneCont, 'Telefon'),
                    myWidTF(citizenCont, 'Kimlik No'),
                    myWidTF(emailCont, 'E-Mail'),
                  ],
                ),
              );
            });
        vm.setData();
      },
      leading: const Icon(Icons.add),
      title: const Text('Müşteri Ekle'),
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
              onChanged: (value) {
                vm.query(value);
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ne aramıştınız?',
                  prefixIcon: Icon(Icons.search, color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
