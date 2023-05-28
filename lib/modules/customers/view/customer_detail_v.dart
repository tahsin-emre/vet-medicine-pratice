import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:veterinarypratice/models/customer_model.dart';
import 'package:veterinarypratice/modules/customers/vm/customer_detail_vm.dart';

class CustomerDetailView extends StatelessWidget {
  final CustomerDetailVM vm = CustomerDetailVM();
  final CustomerModel customer;
  CustomerDetailView(this.customer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ScreenTypeLayout.builder(
        mobile: (p0) => mobile(p0),
        desktop: (p0) => Row(children: [
          SizedBox(width: 900, child: mobile(p0)),
        ]),
      ),
    );
  }

  Widget mobile(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          Text(customer.name),
        ],
      );
    });
  }
}
