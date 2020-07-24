import 'package:flutterlearning/StateManagement/Item.dart';

class CatalogModel{
  static List<Item> items = [
    new Item(1, 'Code Smell'),
    new Item(2, 'Control Flow'),
    new Item(3, 'Interpreter'),
    new Item(4, 'Recursion'),
    new Item(5, 'Sprint'),
    new Item(6, 'Heisenbug'),
  ];

  int getItemsLength() => items.length;
  /// Get item by [id].
  ///
  /// In this sample, the catalog is infinite, looping over [itemNames].
  Item getById(int id) => Item(id, items[id % items.length].name);

  /// Get item by its position in the catalog.
  Item getByPosition(int position) {
    // In this simplified case, an item's position in the catalog
    // is also its id.
    return getById(position);
  }
}