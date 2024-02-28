import 'package:flutter/material.dart';
import '../../../mediaquery/media_query.dart';
import '../../shop/components/product_card_shop.dart';

class CustomRowForGroceries extends StatefulWidget {
  final List imagesGroceries;

  const CustomRowForGroceries({super.key, required this.imagesGroceries});

  @override
  State<CustomRowForGroceries> createState() => _CustomRowForGroceriesState();
}

class _CustomRowForGroceriesState extends State<CustomRowForGroceries> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQueryHelper.height * 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:
            widget.imagesGroceries.length, // Change this according to your data
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
                height: MediaQueryHelper.height * 220,
                width: MediaQueryHelper.width * 430,
                // color: Colors.black87,
                child: ProductCard(imagePath: widget.imagesGroceries[index])),
          );
        },
      ),
    );
  }
}

// imagePath: widget.imagesGroceries[index]
