import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veterinarypratice/models/customer_model.dart';

class CustomerService {
  static var db = FirebaseFirestore.instance;
  static List<CustomerModel> customerList = [];

  static Future getCustomers() async {
    var data = await db.collection('customers').get();
    customerList.clear();
    for (var element in data.docs) {
      customerList.add(CustomerModel.fromQDS(element));
    }
  }

  static Future addCustomer(CustomerModel model) async {
    var result = await db.collection('customers').add({
      'name': model.name,
      'email': model.email,
      'phone': model.phone,
      'citizenId': model.citizenId,
    });
    model.id = result.id;
    customerList.add(model);
  }
}
