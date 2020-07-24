import 'package:flutter/material.dart';
import 'package:flutterlearning/StateManagement/CartModel.dart';
import 'package:flutterlearning/StateManagement/CatalogModel.dart';
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
      '/': (context) => MyList(),
      '/cart': (context) => MyCart(),
      },
    );
  }
}

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {

  @override
  Widget build(BuildContext context) {

    var catalog = Provider.of<CatalogModel>(context);
    var cart = Provider.of<CartModel>(context);

    return Scaffold(
      body: Container(
        child:
          ListView.builder(
            itemCount: catalog.getItemsLength(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${catalog.getById(index).name}'),
                subtitle: Text('\$${catalog.getById(index).price}'),
                trailing: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => addItem(index, cart, catalog),
                ),
              );
            },
          )
      ),
      appBar: new AppBar(
        title: Text('Product Catalog'),
        backgroundColor: Colors.amber.shade800,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'My Cart',
            onPressed: () {
              print("Cart button pressed");
              Navigator.pushReplacementNamed(context, '/cart');
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Consumer<CartModel>(builder: (context, cart, child) {
                return new Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: new Text( '${cart.totalItems}',
                    style: new TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                );
              }),
            ],
          )
        ],
      ),
    );
  }

  addItem(int index, var cart, var catalog) {
    print('add item called');
    cart.add(catalog.getById(index));
  }
}


class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
            child: Text('This is cart page'),
          )
      ),
      appBar: new AppBar(
        title: Text('My Cart'),
        backgroundColor: Colors.amber.shade800,

        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'My Catalog',
            onPressed: () {
              print("Home Catalog button pressed");
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
