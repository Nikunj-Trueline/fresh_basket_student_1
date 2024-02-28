import 'package:flutter/material.dart';
import '../../../mediaquery/media_query.dart';
import '../../shop/components/product_card_shop.dart';

class CustomRowForExclusive extends StatefulWidget {
  final List imagesExclusive;

  const CustomRowForExclusive({super.key, required this.imagesExclusive});

  @override
  State<CustomRowForExclusive> createState() => _CustomRowForExclusiveState();
}

class _CustomRowForExclusiveState extends State<CustomRowForExclusive> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQueryHelper.height * 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:
            widget.imagesExclusive.length, // Change this according to your data
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
                height: MediaQueryHelper.height * 220,
                width: MediaQueryHelper.width * 430,
                // color: Colors.black87,
                child: ProductCard(
                  imagePath: widget.imagesExclusive[index],
                )),
          );
        },
      ),
    );
  }
}

//  imagePath: widget.imagesExclusive[index]
