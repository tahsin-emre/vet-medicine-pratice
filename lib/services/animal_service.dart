import 'package:cloud_firestore/cloud_firestore.dart';

class AnimalService {
  static var db = FirebaseFirestore.instance;

  static Future<QuerySnapshot<Map<String, dynamic>>> getAnimals() async {
    return await db.collection('animals').get();
  }
}
