import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSuffixIcon extends StatelessWidget {
  final String svgIcon;
  final double height;
  final double bottomPadding;
  final double leftPadding;
  final double topPadding;

  const CustomSuffixIcon(this.svgIcon,
      {super.key,
      required this.height,
      required this.bottomPadding,
      this.leftPadding = 0.0,
      this.topPadding = 14.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        leftPadding,
        topPadding,
        14,
        bottomPadding,
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: height,
        colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ),
    );
  }
}
