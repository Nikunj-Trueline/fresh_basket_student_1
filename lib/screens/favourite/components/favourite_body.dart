import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/common/common_sizebox.dart';
import 'package:fresh_basket_mine/mediaquery/media_query.dart';
import 'favourite_card.dart';

class FavouriteBody extends StatefulWidget {
  const FavouriteBody({super.key});

  @override
  State<FavouriteBody> createState() => _FavouriteBodyState();
}

class _FavouriteBodyState extends State<FavouriteBody> {
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
          CommonSizeBox(height: MediaQueryHelper.height * 50),
          const Text(
            "Favourite",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
          ),
          CommonSizeBox(height: MediaQueryHelper.height * 5),
          SizedBox(
            height: MediaQueryHelper.height * 750,
            width: double.infinity,
            child: ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    commonDivider(),
                    FavouriteCard(
                      imagePath: images[index],
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
