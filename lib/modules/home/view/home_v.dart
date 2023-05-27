import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:veterinarypratice/modules/home/vm/home_vm.dart';

class HomeView extends StatelessWidget {
  final HomeVM vm = HomeVM();
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false),
      body: ScreenTypeLayout.builder(
        mobile: (context) => mobile(context),
        desktop: (context) => Row(
          children: [
            Expanded(child: rail()),
            SizedBox(width: 900, child: mobile(context)),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

  Widget mobile(BuildContext context) {
    return Column();
  }

  Widget rail() {
    return Container();
  }
}
