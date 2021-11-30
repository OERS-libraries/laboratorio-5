import 'package:flutter/material.dart';
import 'package:example_app/constants/colors.dart';
import 'package:example_app/models/cart.dart';

class CartView extends StatefulWidget {
  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _body(context),
      bottomNavigationBar: _bottomNavBar(context),
    );
  }

  AppBar _buildAppBar(context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Column(
        children: [
          const Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text("${demoCarts.length} items",
              style: Theme.of(context).textTheme.caption)
        ],
      ),
      elevation: 0,
    );
  }

  Widget _body(context) {
    return _itemListPromo(context);
  }

  ListView _itemListPromo(context) {
    return ListView.builder(
        itemCount: demoCarts.length,
        itemBuilder: (context, index) => Dismissible(
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  demoCarts.removeAt(index);
                });
              },
              key: Key(demoCarts[index].product.id.toString()),
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(color: Color(0xFFFFE6E6)),
                child: Row(
                  children: [
                    Spacer(),
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Image.asset(demoCarts[index].product.image)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          demoCarts[index].product.title,
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        Text("\$" +
                            demoCarts[index].product.price.toString() +
                            " x${demoCarts[index].numOfItems}")
                      ],
                    ),
                  )
                ],
              ),
            ));
  }

  Widget _bottomNavBar(context){
    return Container(
      height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
        boxShadow: [BoxShadow(offset: Offset(0,-15),blurRadius: 20,color: Colors.black.withOpacity(0.05))]
      ),
    );
  }
}
