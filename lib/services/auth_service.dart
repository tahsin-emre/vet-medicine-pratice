import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:veterinarypratice/enums/result.dart';
import 'package:veterinarypratice/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veterinarypratice/services/animal_service.dart';
import 'package:veterinarypratice/services/customer_service.dart';
import 'package:veterinarypratice/services/reservation_service.dart';
import 'package:veterinarypratice/services/veterinarian_service.dart';

class AuthService {
  static var db = FirebaseFirestore.instance;
  static var auth = FirebaseAuth.instance;
  static SharedPreferences? prefs;

  static Future getPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<Result> login(String email, String pass) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: pass);
      var data = await db.collection('accounts').doc(auth.currentUser!.uid).get();
      UserModel.fromDS(data);

      return Result.okay;
    } catch (e) {
      log(e.toString());

      return Result.error;
    }
  }

  static Future logout() async {
    await auth.signOut();
    AnimalService.animalList.clear();
    CustomerService.customerList.clear();
    ReservationService.reservationList.clear();
    VeterinarianService.veterinarianList.clear();
    UserModel.logout();
  }

  static Future forgotPass(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}
