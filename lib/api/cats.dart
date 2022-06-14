// To parse this JSON data, do
//
//     final cat = catFromJson(jsonString);

import 'dart:convert';

List<Cat> catFromJson(String str) => List<Cat>.from(json.decode(str).map((x) => Cat.fromJson(x)));

String catToJson(List<Cat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cat {
  Cat({
    required this.id,
    required this.name,
    required this.temperament,
    required this.description,
  });
  String id;
  String name;
  String description;
  String temperament;

  factory Cat.fromJson(Map<String, dynamic> json) => Cat(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    temperament: json["temperament"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "temperament": temperament,
    "description": description,
  };
}


