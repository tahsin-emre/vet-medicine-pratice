import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:veterinarypratice/extensions/string_ext.dart';
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

  static Future addAnimal(AnimalModel animal) async {
    var result = await db.collection('animals').add({
      'name': animal.name,
      'ownerId': animal.ownerId,
      'type': animal.type,
    });
    animal.id = result.id;
    animal.customer = animal.ownerId.toCustomer();
    animalList.add(animal);
  }
}
