import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:veterinarypratice/enums/result.dart';
import 'package:veterinarypratice/models/user_model.dart';

class AuthService {
  static var db = FirebaseFirestore.instance;
  static var auth = FirebaseAuth.instance;

  static Future<Result> login(String email, String pass) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: pass);
      var data = await db.collection('accounts').doc(auth.currentUser!.uid).get();
      UserModel.fromDS(data);
      return Result.okay;
    } catch (e) {
      return Result.error;
    }
  }
}
