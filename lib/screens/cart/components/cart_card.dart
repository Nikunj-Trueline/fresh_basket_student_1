import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/constant/gradient.dart';
import '../../../mediaquery/media_query.dart';

class CartCard extends StatefulWidget {
  final String image;

  const CartCard({super.key, required this.image});

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQueryHelper.height * 180,
      width: MediaQueryHelper.width * double.infinity,
      // color: Colors.amber.shade100,
      child: Row(
        children: [
          SizedBox(
            height: MediaQueryHelper.height * 170,
            width: MediaQueryHelper.width * 250,
            //  color: Colors.amber.shade500,
            child: Center(
              child: Image(image: AssetImage(widget.image), height: 130),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Spacer(
                  flex: 5,
                ),
                const Text(
                  "GRAPES",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const Text("1 KG PRICE"),
                const Spacer(
                  flex: 6,
                ),
                Row(
                  children: [
                    const Spacer(
                      flex: 6,
                    ),
                    FloatingActionButton(
                      backgroundColor: primaryColor1,
                      onPressed: () {},
                      child: Image.asset("assets/images/minus.png",
                          height: 50, width: 27),
                    ),
                    const Spacer(
                      flex: 6,
                    ),
                    const Text("1",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.w400)),
                    const Spacer(
                      flex: 6,
                    ),
                    FloatingActionButton(
                      backgroundColor: primaryColor1,
                      onPressed: () {},
                      child: const Image(
                          image: AssetImage("assets/images/plus.png"),
                          height: 30,
                          width: 30),
                    ),
                    const Spacer(
                      flex: 6,
                    ),
                  ],
                ),
                const Spacer(
                  flex: 6,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQueryHelper.height * 160,
            width: MediaQueryHelper.width * 340,
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
