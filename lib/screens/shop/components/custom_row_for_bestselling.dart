import 'package:flutter/material.dart';
import '../../../mediaquery/media_query.dart';
import '../../shop/components/product_card_shop.dart';

class CustomRowForBestSelling extends StatefulWidget {
  final List imagesBestSelling;

  const CustomRowForBestSelling({super.key, required this.imagesBestSelling});

  @override
  State<CustomRowForBestSelling> createState() =>
      _CustomRowForBestSellingState();
}

class _CustomRowForBestSellingState extends State<CustomRowForBestSelling> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQueryHelper.height * 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget
            .imagesBestSelling.length, // Change this according to your data
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
                height: MediaQueryHelper.height * 220,
                width: MediaQueryHelper.width * 430,
                // color: Colors.black87,
                child: ProductCard(
                  imagePath: widget.imagesBestSelling[index],
                )),
          );
        },
      ),
    );
  }
}

//  imagePath: widget.imagesBestSelling[index],
