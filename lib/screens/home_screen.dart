import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jkb_sept/models/product.dart';
import 'package:jkb_sept/screens/cart_screen.dart';
import 'package:jkb_sept/widgets/cart_floating_action_button.dart';
import 'package:jkb_sept/widgets/product_list_tile.dart';

Product getProductById(int id) {
  return products.where((element) => element.id == id).first;
}

final List<Product> products = [
  Product(
    id: 1,
    name: 'iPhone 16',
    price: 600,
  ),
  Product(
    id: 2,
    name: 'Samsung S24',
    price: 500,
  ),
  Product(
    id: 3,
    name: 'Nokia',
    price: 50,
  ),
  Product(
    id: 4,
    name: 'Oppo S19',
    price: 100,
  ),
  Product(
    id: 5,
    name: 'Vivo V25',
    price: 100,
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<int, int> cart = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        floatingActionButton: CartFloatingActionButton(
          onTap: () {
            log('button kisine press kiya');
            Navigator.of(context).push<Map<int, int>>(
              MaterialPageRoute(
                builder: (context) {
                  return CartScreen(cart: cart);
                },
              ),
            ).then((value) {
              setState(() {
                if (value != null) {
                  cart = value;
                }
              });
            });
          },
        ),
        body: Column(
          children: [
            Image(
              image: AssetImage(
                'assets/bell_icon.png',
              ),
              fit: BoxFit.cover,
              height: 200,
              width: 200,
            ),
            SvgPicture.asset(
              'assets/bell_icon.svg',
              height: 200,
              width: 200,
            ),
          ],
        )
        // ListView.separated(
        //   itemCount: products.length,
        //   itemBuilder: (context, index) {
        //     final product = products[index];
        //     return ProductListTile(
        //       product: product,
        //       quantity: getQuantity(product),
        //       onTapAdd: () => addItemButtonClickEvent(product),
        //       onTapRemove: () => removeItemButtonClickEvent(product),
        //     );
        //   },
        //   separatorBuilder: (context, index) {
        //     return const Divider(height: 1);
        //   },
        // ),
        );
  }

  void addItemButtonClickEvent(Product product) {
    setState(() {
      if (cart.containsKey(product.id)) {
        // cart mai pehle seh hai kuch quantity ke saath
        final quantity = cart[product.id] as int;
        cart[product.id] = quantity + 1;
      } else {
        // cart mai nhi hai
        cart[product.id] = 1;
      }
    });
  }

  void removeItemButtonClickEvent(Product product) {
    setState(() {
      if (cart.containsKey(product.id)) {
        // cart mai pehle seh hai kuch quantity ke saath
        final quantity = cart[product.id] as int;
        if (quantity > 0) {
          cart[product.id] = quantity - 1;
        } else {
          cart.remove(product.id);
        }
      }
    });
  }

  int getQuantity(Product product) {
    if (cart.containsKey(product.id)) {
      // cart mai pehle seh hai kuch quantity ke saath
      return cart[product.id] as int;
    } else {
      return 0;
    }
  }
}
