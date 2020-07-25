import 'package:flutterlearning/StateManagement/Item.dart';

class CatalogModel{
  static List<Item> items = [
    new Item(1, 'Code Smell', 20),
    new Item(2, 'Control Flow', 10),
    new Item(3, 'Interpreter', 15),
    new Item(4, 'Recursion', 35),
    new Item(5, 'Sprint', 25),
    new Item(6, 'Heisenbug', 45),
  ];

  int getItemsLength() => items.length;
  /// Get item by [id].
  ///
  /// In this sample, the catalog is infinite, looping over [itemNames].
  Item getById(int id){
//    Item(id, items[id % items.length].name)
    var item = items[id % items.length];
    return Item(id, item.name, item.price);
  }

  /// Get item by its position in the catalog.
  Item getByPosition(int position) {
    // In this simplified case, an item's position in the catalog
    // is also its id.
    return getById(position);
  }
}