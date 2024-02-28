import 'package:flutter/material.dart';

class ProductCardForProductBody extends StatefulWidget {
  final String imagePath;
  final String productName;
  final String productDescription;
  final String productPrice;
  final String productQuantity;

  const ProductCardForProductBody({super.key, required this.imagePath, required this.productName, required this.productDescription, required this.productPrice, required this.productQuantity});

  @override
  State<ProductCardForProductBody> createState() =>
      _ProductCardForProductBodyState();
}

class _ProductCardForProductBodyState extends State<ProductCardForProductBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey,
          width: 0.6,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(widget.imagePath),
              height: MediaQuery.of(context).size.height * 0.075,
              width: double.infinity,
            ),
            Text(
             widget.productName.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
             Text(
              widget.productDescription,
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            const Spacer(),
            Row(
              children: [
                 Text(
                  "\$ ${widget.productPrice}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
