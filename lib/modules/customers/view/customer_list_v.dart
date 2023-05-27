import 'package:flutter/material.dart';
import 'package:veterinarypratice/models/customer_model.dart';
import 'package:veterinarypratice/modules/customers/vm/customer_list_vm.dart';

class CustomerListView extends StatelessWidget {
  final CustomerListVM vm = CustomerListVM();
  CustomerListView({super.key});

  @override
  Widget build(BuildContext context) {
    vm.setData();
    return Column(
      children: [
        ...vm.customers.map((e) => customerTile(context, e)),
      ],
    );
  }

  Widget customerTile(BuildContext context, CustomerModel customer) {
    return ListTile(
      onTap: () {},
      leading: const Icon(Icons.person),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: Text(customer.name),
      subtitle: Text(customer.phone),
    );
  }
}
