import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fresh_basket_mine/common/common_sizebox.dart';
import 'package:fresh_basket_mine/mediaquery/media_query.dart';
import 'package:fresh_basket_mine/screens/product_detail/components/product_details_description.dart';
import '../../../constant/gradient.dart';
import 'custom_button_add_to_cart.dart';

class ProductDetailBody extends StatefulWidget {
  const ProductDetailBody({super.key});

  @override
  State<ProductDetailBody> createState() => _ProductDetailBodyState();
}

class _ProductDetailBodyState extends State<ProductDetailBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQueryHelper.height * 380,
              width: MediaQueryHelper.width * double.infinity,
              decoration: const BoxDecoration(
                //color: Colors.black12,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Center(
                child: Image.asset("assets/images/broccoli.jpg",
                    height: 300, width: 300),
              ),
            ),
            CommonSizeBox(height: MediaQueryHelper.height * 20),
            const Row(
              children: [
                CommonSizeBox(width: 20),
                Text(
                  "Naturel Green Broccoli",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer()
              ],
            ),
            const Row(
              children: [
                CommonSizeBox(width: 20),
                Text(
                  "1 kg, Price",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.black45),
                ),
                Spacer()
              ],
            ),
            CommonSizeBox(height: MediaQueryHelper.height * 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
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
                    flex: 15,
                  ),
                  const Text("1",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 36,
                          fontWeight: FontWeight.w400)),
                  const Spacer(
                    flex: 15,
                  ),
                  FloatingActionButton(
                    backgroundColor: primaryColor1,
                    onPressed: () {},
                    child: Image(
                        image: const AssetImage("assets/images/plus.png"),
                        height: MediaQueryHelper.height * 40,
                        width: 40),
                  ),
                  const Spacer(
                    flex: 100,
                  ),
                  Text(
                    "\$4.99",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQueryHelper.height * 40,
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(
                    flex: 6,
                  ),
                ],
              ),
            ),
            CommonSizeBox(height: MediaQueryHelper.height * 20),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Divider(),
            ),
            productDetailsDescription(),
            CommonSizeBox(height: MediaQueryHelper.height * 15),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 10),
              child: Row(
                children: [
                  const CommonSizeBox(width: 15),
                  const Text(
                    "Nutrition's",
                    style: TextStyle(fontSize: 30),
                  ),
                  const Spacer(),
                  Container(
                    height: 35,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text("100 gr"),
                    ),
                  )
                ],
              ),
            ),
            CommonSizeBox(height: MediaQueryHelper.height * 15),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Row(
                children: [
                  const CommonSizeBox(width: 15),
                  Text(
                    "Review",
                    style: TextStyle(fontSize: MediaQueryHelper.height * 30),
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      // color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 35,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            CommonSizeBox(height: MediaQueryHelper.height * 20),
            AddToBasketButton(
              data: "Add To Basket",
              fontSize: 30,
              color: Colors.black,
              onPressed: () {},
            ),
            CommonSizeBox(height: MediaQueryHelper.height * 30),
          ],
        ),
      ),
    );
  }
}
