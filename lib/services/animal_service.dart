import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veterinarypratice/models/animal_model.dart';

class AnimalService {
  static var db = FirebaseFirestore.instance;
  static List<AnimalModel> animalList = [];

  static Future getAnimals() async {
    var data = await db.collection('animals').get();
    for (var element in data.docs) {
      animalList.add(AnimalModel.fromQDS(element));
    }
  }
}
