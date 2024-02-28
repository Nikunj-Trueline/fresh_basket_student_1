import 'package:flutter/material.dart';
import '../../../common/common_header_row.dart';
import '../../../common/common_sizebox.dart';
import 'custom_row_for_bestselling.dart';
import 'custom_row_for_exclusive.dart';
import 'custom_row_for_groceries.dart';
import 'heading_row.dart';
import 'middle_container_shop.dart';

class ShoppingBody extends StatefulWidget {
  const ShoppingBody({super.key});

  @override
  State<ShoppingBody> createState() => _ShoppingBodyState();
}

class _ShoppingBodyState extends State<ShoppingBody> {
  List images = [
    "assets/images/i3.png",
    "assets/images/header1.png",
    "assets/images/i1.png",
  ];

  List fruitImagesExclusive = [
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

  List fruitImagesBestSelling = [
    "assets/images/grapes.jpg",
    "assets/images/oranges.jpg",
    "assets/images/banana.jpg",
    "assets/images/Pomegranate.jpg",
    "assets/images/watermelon.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const CommonSizeBox(height: 35),
              Column(
                children: [
                  customHeaderRow(
                      header: "Surat, Gujarat",
                      path: "assets/images/location.png",
                      height: 30,
                      width: 30),
                  const CommonSizeBox(height: 10),
                  middleContainer(images: images, itemCount: images.length),
                  const CommonSizeBox(height: 20),
                  headingRow(
                      textForHeading: "Exclusive offers",
                      textForButton: "See all"),
                  const CommonSizeBox(height: 15),
                  //   MyApp()
                ],
              ),
              CustomRowForExclusive(
                imagesExclusive: fruitImagesExclusive,
              ),
              const CommonSizeBox(height: 15),
              headingRow(
                  textForHeading: "Best Selling", textForButton: "See all"),
              CustomRowForBestSelling(
                imagesBestSelling: fruitImagesBestSelling,
              ),
              headingRow(textForHeading: "Groceries", textForButton: "See all"),
              CustomRowForGroceries(imagesGroceries: fruitImagesExclusive),
            ],
          ),
        ),
      ),
    );
  }
}

/*

ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Expanded(child: productCard(context: context));
                  },
                ),
 */
