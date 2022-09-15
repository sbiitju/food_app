import 'package:food_app/data/model/item.dart';

class CategoryItems {
  String? id;
  String? name;
  var items = <Item>[];

  CategoryItems(this.id, this.name, this.items);
}
