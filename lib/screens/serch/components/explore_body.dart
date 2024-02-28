import 'package:flutter/material.dart';
import '../../../common/common_header_row.dart';
import '../../../common/common_sizebox.dart';
import '../../../mediaquery/media_query.dart';
import 'explore_body_method.dart';

class ExploreBody extends StatefulWidget {
  const ExploreBody({super.key});

  @override
  State<ExploreBody> createState() => _ExploreBodyState();
}

class _ExploreBodyState extends State<ExploreBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: double.infinity,
        // color: Colors.deepPurple,
        child: Column(
          children: [
            SizedBox(
              height: MediaQueryHelper.height * 200,
              // color: Colors.grey,
              child: Column(
                children: [
                  customHeaderRow(
                      header: "Find Products",
                      path: "assets/images/Carrot1.png",
                      height: 50,
                      width: 50),
                  const CommonSizeBox(height: 10),
                ],
              ),
            ),
            SizedBox(
              height: MediaQueryHelper.height * 590,
              //color: Colors.green,
              child: const ExploreBodyItemBuilder(),
            )
          ],
        ),
      ),
    );
  }
}
