import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:veterinarypratice/enums/result.dart';
import 'package:veterinarypratice/services/auth_service.dart';
part 'login_vm.g.dart';

class LoginVM = LoginVMBase with _$LoginVM;

abstract class LoginVMBase with Store {
  @observable
  bool isLoading = false;
  @observable
  TextEditingController emailCont = TextEditingController();
  @observable
  TextEditingController passCont = TextEditingController();

  @action
  Future<Result> login() async {
    isLoading = true;
    Result result = await AuthService.login(emailCont.text, passCont.text);
    isLoading = false;
    return result;
  }
}
