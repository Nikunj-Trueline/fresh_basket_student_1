import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/screens/cart/components/cart_body.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return const CartBody();
  }
}
