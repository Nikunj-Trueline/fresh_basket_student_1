import 'package:flutter/cupertino.dart';
import '../../../common/common_sizebox.dart';
import '../../../mediaquery/media_query.dart';

Widget productDetailsDescription() {
  return Column(
    children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CommonSizeBox(width: 20),
          Text(
            "Product Details",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          )
        ],
      ),
      CommonSizeBox(height: MediaQueryHelper.height * 10),
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CommonSizeBox(width: 20),
          Text(
            "Apples Are Nutritious. Apples may Be Good",
            maxLines: 1,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          ),
        ],
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CommonSizeBox(width: 20),
          Text(
            "For Weight Loss. Apples May Be Good .For",
            maxLines: 1,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          ),
        ],
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CommonSizeBox(width: 20),
          Text(
            "Heart As Part of A Healthful. And Varied Diet.",
            textAlign: TextAlign.start,
            maxLines: 1,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    ],
  );
}
