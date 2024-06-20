import 'package:cloud_firestore/cloud_firestore.dart';

class PlantModel {
  String? id;
  String? name;
  String? image;
  String? description;
  String? email;
  PlantModel({this.name, this.id, this.image, this.description, this.email});

  PlantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    email = json['email'];
  }
  PlantModel.fromDocumentSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    final data = json.data();
    id = json.id;
    name = data['name'] ?? "";
    description = data['description'] ?? "";
    image = data['image'] ?? "";
    email = data['email'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['email'] = email;
    return data;
  }
}
