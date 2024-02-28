import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/screens/cart/components/cart_card.dart';

import '../../../common/common_sizebox.dart';
import '../../../mediaquery/media_query.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  List images = [
    "assets/images/banana.jpg",
    "assets/images/watermelon.jpg",
    "assets/images/grapes.jpg",
    "assets/images/oranges.jpg",
    "assets/images/Pomegranate.jpg",
    "assets/images/banana.jpg",
    "assets/images/watermelon.jpg",
    "assets/images/grapes.jpg",
    "assets/images/oranges.jpg",
    "assets/images/Pomegranate.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CommonSizeBox(height: MediaQueryHelper.height * 60),
          const Text(
            "Cart Screen",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
          ),
          CommonSizeBox(height: MediaQueryHelper.height * 15),
          SizedBox(
            height: MediaQueryHelper.height * 730,
            width: double.infinity,
            child: ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    commonDivider(),
                    CartCard(
                      image: images[index],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget commonDivider() {
  return const Padding(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: Divider(
      height: 26,
      color: Colors.black26,
      thickness: 1,
    ),
  );
}

/*
Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey,
                  width: 0.6,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage(images[index]),
                      height: MediaQuery.of(context).size.height * 0.085,
                      width: double.infinity,
                    ),
                    Text(
                      'Herbal Drink'.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Text(
                      '25 ml, Price',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Text(
                          "\$1.55",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
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
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
 */
