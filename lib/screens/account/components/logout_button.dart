import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/mediaquery/media_query.dart';
import '../../../constant/gradient.dart';

class CustomButtonForLogout extends StatefulWidget {
  final void Function()? onPressed;
  final String data;
  final Color? color;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;

  const CustomButtonForLogout(
      {super.key,
      this.onPressed,
      required this.data,
      this.color,
      this.fontFamily,
      this.fontSize,
      this.fontWeight,
      this.letterSpacing});

  @override
  State<CustomButtonForLogout> createState() => _CustomButtonForLogoutState();
}

class _CustomButtonForLogoutState extends State<CustomButtonForLogout> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
      child: SizedBox(
        height: MediaQueryHelper.height * 60,
        width: MediaQueryHelper.height * 350,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(10),
              fixedSize: const Size(250, 60)),
          child: Text(
            widget.data,
            style: TextStyle(
              color: widget.color,
              fontFamily: widget.fontFamily,
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
              letterSpacing: widget.letterSpacing,
            ),
          ),
        ),
      ),
    );
  }
}
