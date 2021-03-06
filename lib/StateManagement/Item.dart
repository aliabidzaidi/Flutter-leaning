import 'package:flutter/material.dart';

@immutable
class Item {
  final int id;
  final String name;
  final int price;
  final Color color;

//  Item(this.id, this.name, this.price);

  Item(this.id, this.name, this.price)
  // To make the sample app look nicer, each item is given one of the
  // Material Design primary colors.
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}


