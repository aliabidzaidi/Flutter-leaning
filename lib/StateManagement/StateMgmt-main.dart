import 'package:flutter/material.dart';
import 'package:flutterlearning/StateManagement/CartModel.dart';
import 'package:flutterlearning/StateManagement/CatalogModel.dart';
import 'package:flutterlearning/StateManagement/MyCart.dart';
import 'package:flutterlearning/StateManagement/MyCatalog.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          Provider(create: (context) => CatalogModel()),
          ChangeNotifierProxyProvider<CatalogModel,CartModel>(
              create: (context) => CartModel(),
              update: (context, catalog, cart){
                cart.catalog =catalog;
                return cart;
              }
            ),
        ],
      child: Root()
    )
  );
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/',
      routes: {
      '/': (context) => MyCatalog(),
      '/cart': (context) => MyCart(),
      },
    );
  }
}

