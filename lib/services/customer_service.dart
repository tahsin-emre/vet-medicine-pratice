import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veterinarypratice/models/customer_model.dart';

class CustomerService {
  static var db = FirebaseFirestore.instance;
  static List<CustomerModel> customerList = [];

  static Future getCustomers() async {
    var data = await db.collection('customers').get();
    for (var element in data.docs) {
      customerList.add(CustomerModel.fromQDS(element));
    }
  }
}
