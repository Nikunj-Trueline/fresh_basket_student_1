import 'package:flutter/cupertino.dart';

// SizedBox commonSizeBox({double? height, double? width}) {
//   return SizedBox(
//     height: height,
//     width: width,
//   );
// }

class CommonSizeBox extends StatelessWidget {
  final double? height;
  final double? width;

  const CommonSizeBox({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
