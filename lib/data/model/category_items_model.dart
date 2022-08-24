import 'item_info_model.dart';

class CategoryItems {
  String? id;
  String? name;
  var items = <ItemInfo>[];

  CategoryItems(this.id, this.name, this.items);
}
