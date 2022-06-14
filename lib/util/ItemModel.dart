// To parse this JSON data, do
//
//     final items = itemsFromMap(jsonString?);

import 'dart:convert';

class Items {
  Items({
     this.getItems,
  });

  GetItems? getItems;

  factory Items.fromJson(String? str) => Items.fromMap(json.decode(str!));

  String? toJson() => json.encode(toMap());

  factory Items.fromMap(Map<String, dynamic>? json) => Items(
    getItems: GetItems.fromMap(json!["getItems"]),
  );

  Map<String?, dynamic> toMap() => {
    "getItems": getItems?.toMap(),
  };
}

class GetItems {
  GetItems({
     this.message,
     this.statusCode,
     this.result,
  });

  String? message;
  int? statusCode;
  Result? result;

  factory GetItems.fromJson(String? str) => GetItems.fromMap(json.decode(str!));

  String? toJson() => json.encode(toMap());

  factory GetItems.fromMap(Map<String?, dynamic> json) => GetItems(
    message: json["message"],
    statusCode: json["statusCode"],
    result: Result.fromMap(json["result"]),
  );

  Map<String?, dynamic> toMap() => {
    "message": message,
    "statusCode": statusCode,
    "result": result?.toMap(),
  };
}

class Result {
  Result({
     this.count,
     this.items,
  });

  int? count;
  List<Item>? items;

  factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

  String? toJson() => json.encode(toMap());

  factory Result.fromMap(Map<String?, dynamic> json) => Result(
    count: json['count'],
    items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
  );

  Map<String?, dynamic> toMap() => {
    "count": count,
    "items": List<dynamic>.from(items!.map((x) => x.toMap())),
  };
}

class Item {
  Item({
     this.id,
     this.meta,
  });

  String? id;
  Meta? meta;

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String? toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String?, dynamic> json) => Item(
    id: json["id"],
    meta: Meta.fromMap(json["meta"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "meta": meta?.toMap(),
  };
}

class Meta {
  Meta({
    this.name,
    this.description,
    this.images,
  });

  String? name;
  dynamic description;
  dynamic images;

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String? toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String?, dynamic> json) => Meta(
    name: json["name"],
    description: json["description"],
    images: json["images"],
  );

  Map<String?, dynamic> toMap() => {
    "name": name,
    "description": description,
    "images": images,
  };
}
