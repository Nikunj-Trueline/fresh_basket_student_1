import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/screens/product/components/product_body_carts.dart';
import 'package:fresh_basket_mine/screens/product_add/product_add_screen.dart';
import '../../../mediaquery/media_query.dart';

class ProductBody extends StatefulWidget {
  const ProductBody({super.key});

  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQueryHelper.height * 50,
              ),
              Text(
                "Fruits".toUpperCase(),
                style: const TextStyle(
                    fontSize: 30,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQueryHelper.height * 10,
              ),
              SizedBox(
                height: MediaQueryHelper.height * 1000,
                //color: Colors.green,
                child: const ProductBodyUI(),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductAddScreen(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
