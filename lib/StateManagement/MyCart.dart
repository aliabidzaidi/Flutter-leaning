
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterlearning/StateManagement/CartModel.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Consumer<CartModel>(
            builder: (context, cart, child) {
              return  ListView(
                children: <Widget>[
                  SizedBox(height:16.0),
                  Center(child: Text('Items in cart: ${cart.totalItems}')),
                  SizedBox(height:16.0),
                  ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cart.totalItems,
                    itemBuilder: (context, index) {
                      var item = cart.items[index];
                      return ListTile(
                        title: Text(item.name),
                      );
                    },
                  ),
                  SizedBox(height: 16.0),
                  Center(child: Text('Total Amount: \$${cart.totalPrice}'),),
                  SizedBox(height: 16.0),
                ],
              );
//              return new Center(
//                child: Text('This is cart page -- ${cart.totalItems} --${cart.totalPrice}'),
//              );
            },
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
