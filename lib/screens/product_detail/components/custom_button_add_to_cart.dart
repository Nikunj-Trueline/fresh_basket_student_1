import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/mediaquery/media_query.dart';
import '../../../constant/gradient.dart';

class AddToBasketButton extends StatefulWidget {
  final void Function()? onPressed;
  final String data;
  final Color? color;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;

  const AddToBasketButton(
      {super.key,
      this.onPressed,
      required this.data,
      this.color,
      this.fontFamily,
      this.fontSize,
      this.fontWeight,
      this.letterSpacing});

  @override
  State<AddToBasketButton> createState() => _AddToBasketButtonState();
}

class _AddToBasketButtonState extends State<AddToBasketButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        width: MediaQueryHelper.width * double.infinity,
        height: MediaQueryHelper.height * 60,
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

/*
Widget customButtonForSignIn({
  required void Function()? onPressed,
  required String data,
  Color? color,
  String? fontFamily,
  double? fontSize,
  FontWeight? fontWeight,
  double? letterSpacing,
}) {
  return Expanded(
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(10),
          fixedSize: const Size(250, 60)),
      child: Text(
        data,
        style: TextStyle(
          color: color,
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
        ),
      ),
    ),
  );
}
 */
