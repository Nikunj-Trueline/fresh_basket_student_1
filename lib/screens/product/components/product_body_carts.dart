import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/firebase/firebase_servicies.dart';
import 'package:fresh_basket_mine/routes/project_routes.dart';
import 'package:fresh_basket_mine/screens/product/components/product_card_for_product.dart';
import '../../shop/components/product_card_shop.dart';

class ProductBodyUI extends StatefulWidget {
  const ProductBodyUI({super.key});

  @override
  State<ProductBodyUI> createState() => _ProductBodyUIState();
}

class _ProductBodyUIState extends State<ProductBodyUI> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  FirebaseService service = FirebaseService();

  List allProductData = [];

  Future<List> getData() async {
    Map? data = await service.getProduct();

    if (data != null) {
      data.forEach((key, value) {
        allProductData.add(value);
      });
    }

    return allProductData;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: GridView.builder(
          itemCount: allProductData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.productDetail);
                },
                child:  ProductCardForProductBody(
                  imagePath: allProductData[index]["image"],
                  productDescription: allProductData[index]["description"],
                  productName: allProductData[index]["name"],
                  productPrice:allProductData[index]["price"],
                  productQuantity: allProductData[index]["quantity"],
                ));
          }),
    );
  }
}

// "assets/images/banana.jpg"
