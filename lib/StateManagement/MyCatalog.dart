import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterlearning/StateManagement/CartModel.dart';
import 'package:flutterlearning/StateManagement/CatalogModel.dart';

class MyCatalog extends StatefulWidget {
  @override
  _MyCatalogState createState() => _MyCatalogState();
}

class _MyCatalogState extends State<MyCatalog> {

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
                contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal:8.0),
                dense:true,
                trailing: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => addItem(index, cart, catalog),
                ),
//                Container(
//                  child: Row(
//                    mainAxisSize: MainAxisSize.min,
//                    children: <Widget>[
//                      Column(
//                        children: <Widget>[
//                          IconButton(
//                            icon: const Icon(Icons.add),
//                            onPressed: () => addItem(index, cart, catalog),
//                          ),
//                          Expanded(
//                            child: IconButton(
//                              icon: const Icon(Icons.remove),
//                              onPressed: () => addItem(index, cart, catalog),
//                            ),
//                          ),
//                        ],
//                      ),
//                      Center(
//                        child: Text('0')
//                      )
//                    ],
//                  ),
//                )

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
