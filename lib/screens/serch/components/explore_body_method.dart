import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/routes/project_routes.dart';
import '../../../mediaquery/media_query.dart';

class ExploreBodyItemBuilder extends StatefulWidget {
  const ExploreBodyItemBuilder({super.key});

  @override
  State<ExploreBodyItemBuilder> createState() => _ExploreBodyItemBuilderState();
}

class _ExploreBodyItemBuilderState extends State<ExploreBodyItemBuilder> {
  List imagesForExplore = [
    "assets/images/basket3.jpg",
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

  List categoryName = [
    'Fruits',
    'Fruits',
    'Fruits',
    'Fruits',
    'Fruits',
    'Fruits',
    'Fruits',
    'Fruits',
    'Fruits',
    'Fruits',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: GridView.builder(
          itemCount: 1,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
            crossAxisSpacing: 22,
            mainAxisSpacing: 22,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.product);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.6,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage(imagesForExplore[index]),
                        //      height: MediaQuery.of(context).size.height * 0.1,
                        height: MediaQueryHelper.height * 150,
                        width: double.infinity,
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Center(
                        child: Text(
                          categoryName[index].toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
