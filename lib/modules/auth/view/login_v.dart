import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:veterinarypratice/enums/result.dart';
import 'package:veterinarypratice/modules/auth/vm/login_vm.dart';
import 'package:veterinarypratice/modules/home/view/home_v.dart';
import 'package:veterinarypratice/ui/mywid_loading.dart';
import 'package:veterinarypratice/ui/mywid_snack.dart';
import 'package:veterinarypratice/ui/mywid_tf.dart';

class LoginView extends StatelessWidget {
  final LoginVM vm = LoginVM();
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    vm.getPrefs();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Veterinary Medicine'),
      ),
      body: ScreenTypeLayout.builder(
        mobile: (context) => mobile(context),
        desktop: (context) => Row(children: [
          Expanded(child: Container()),
          SizedBox(width: 900, child: mobile(context)),
          Expanded(child: Container()),
        ]),
      ),
    );
  }

  Widget mobile(BuildContext context) {
    return Center(
      child: Observer(builder: (_) {
        return vm.isLoading
            ? myWidLoading()
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('LOGIN TO YOUR ACCOUNT',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 10),
                  myWidTF(vm.emailCont, 'E-Mail'),
                  myWidTF(vm.passCont, 'Password'),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text('Forgot My Password'),
                      ),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      vm.login().then((value) {
                        if (value == Result.error) {
                          showSnack(context, 'E-Mail and Password does not match.');
                        } else {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => HomeView()),
                              (route) => false);
                        }
                      });
                    },
                    icon: const Icon(Icons.arrow_forward_ios),
                    label: const Text('Login'),
                  )
                ],
              );
      }),
    );
  }
}
