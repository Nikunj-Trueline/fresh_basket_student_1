import 'package:flutter/material.dart';
import '../../../common/common_sizebox.dart';
import '../../../constant/text_theme.dart';
import '../../../mediaquery/media_query.dart';

class LayoutHeader extends StatelessWidget {
  const LayoutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonSizeBox(height: MediaQueryHelper.height * 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage("assets/images/login_use.jpg"),
              height: MediaQueryHelper.height * 180,
              width: MediaQueryHelper.width * 460,
            ),
          ],
        ),
        CommonSizeBox(height: MediaQueryHelper.height * 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "REGISTER ACCOUNT",
              style: headingStyle,
            ),
          ],
        ),
        CommonSizeBox(height: MediaQueryHelper.height * 8),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "COMPLETE YOUR DETAILS OR CONTINUE \n WITH SOCIAL MEDIA",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
