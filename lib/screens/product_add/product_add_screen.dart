import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/model/product_model.dart';
import 'package:fresh_basket_mine/screens/product/product_screen.dart';
import '../../firebase/firebase_servicies.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({super.key});

  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  final productName = TextEditingController();
  final productDesc = TextEditingController();
  final productPrice = TextEditingController();
  final productQuantity = TextEditingController();

  FirebaseService service = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manage Product',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.amber,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white.withOpacity(.7),
                  child: const Icon(
                    Icons.add,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: productName,
                  decoration: const InputDecoration(labelText: 'Product Name'),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: productDesc,
                  decoration:
                      const InputDecoration(labelText: 'Product Description'),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: productPrice,
                        decoration: const InputDecoration(labelText: 'Price'),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: productQuantity,
                        decoration:
                            const InputDecoration(labelText: 'Stock Quantity'),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    // code

                    String prImage = "";
                    String prName = productName.text.toString().trim();
                    String prDes = productDesc.text.toString().trim();
                    String prPrice = productPrice.text.toString().trim();
                    String prQuntity = productQuantity.text.toString().trim();

                    var product = GroceryProduct(
                      name: prName,
                      image: prImage,
                      price: prPrice,
                      quantity: prQuntity,
                      description: prDes,
                    );

                    service.addProduct(product).then((value) {

                      print("ALL DONE");

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductScreen(),
                          ));
                    });
                  },
                  child: const Text("Add product"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
