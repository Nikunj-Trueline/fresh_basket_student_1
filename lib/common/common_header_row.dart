import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/common/search_field.dart';
import 'common_sizebox.dart';

/*
Common row for header which is used in shop and explore
screen.
 */

Widget customHeaderRow(
    {required String header,
    required String path,
    double? height,
    double? width}) {
  return SizedBox(
    height: 160,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(path),
              height: height,
              width: width,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              header,
              style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppins',
                  color: Colors.black87),
            ),
          ],
        ),
        const CommonSizeBox(height: 20),
        const SearchField(),
      ],
    ),
  );
}
