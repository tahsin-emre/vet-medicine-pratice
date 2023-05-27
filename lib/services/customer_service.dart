import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerService {
  static var db = FirebaseFirestore.instance;

  static Future<QuerySnapshot<Map<String, dynamic>>> getCustomers() async {
    return await db.collection('customers').get();
  }
}
