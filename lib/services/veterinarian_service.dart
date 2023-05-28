import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veterinarypratice/models/veterinarian_model.dart';

class VeterinarianService {
  static var db = FirebaseFirestore.instance;
  static List<VeterinarianModel> veterinarianList = [];

  static Future getVeterinarians() async {
    var data = await db.collection('veterinarians').get();
    for (var element in data.docs) {
      veterinarianList.add(VeterinarianModel.fromQDS(element));
    }
  }

  static Future addVeterinarian(VeterinarianModel veterinarian) async {
    var result = await db.collection('veterinarians').add({
      'name': veterinarian.name,
    });
    veterinarian.id = result.id;
    veterinarianList.add(veterinarian);
  }
}
