import 'package:flutter/material.dart';
import '../../../common/custom_suffix_icon.dart';

Widget commonLisTile(
    {required String iconPath,
    required String text,
    required void Function()? onPressed}) {
  return ListTile(
    leading:
        CustomSuffixIcon(iconPath, topPadding: 0, height: 30, bottomPadding: 5),
    title: Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
    ),
    trailing: IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.navigate_next,
        size: 40,
        color: Colors.black,
      ),
    ),
    onTap: () {},
  );
}
