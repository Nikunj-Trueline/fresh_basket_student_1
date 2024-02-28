import 'package:flutter/material.dart';
import '../../../mediaquery/media_query.dart';

class FavouriteCard extends StatefulWidget {
  final String imagePath;

  const FavouriteCard({super.key, required this.imagePath});

  @override
  State<FavouriteCard> createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQueryHelper.height * 160,
      width: MediaQueryHelper.width * double.infinity,
      // color: Colors.amber.shade100,
      child: Row(
        children: [
          SizedBox(
            height: MediaQueryHelper.height * 160,
            width: MediaQueryHelper.width * 250,
            //  color: Colors.amber.shade500,
            child: Center(
              child: Image(image: AssetImage(widget.imagePath), height: 130),
            ),
          ),
          const Expanded(
            child: Column(
              children: [
                Spacer(
                  flex: 6,
                ),
                Text(
                  "GRAPES",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Text("1 KG PRICE"),
                Spacer(
                  flex: 6,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQueryHelper.height * 160,
            width: MediaQueryHelper.width * 350,
            //   color: Colors.amber.shade500,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "\$1.50",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                        size: 30,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
