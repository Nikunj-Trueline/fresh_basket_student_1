import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/screens/signup/components/sign_up_form.dart';
import '../../../common/common_sizebox.dart';
import '../../../mediaquery/media_query.dart';
import 'header_signup.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQueryHelper.height * 300,
            margin: const EdgeInsets.only(left: 18.0, right: 18),
            child: const LayoutHeader(),
          ),
          CommonSizeBox(
            height: MediaQueryHelper.height * 10,
          ),
          Container(
            height: MediaQueryHelper.height * 580,
            width: MediaQueryHelper.width * double.infinity,
            margin: const EdgeInsets.only(left: 18.0, right: 18),
            child: const SignUpForm(),
          ),
        ],
      ),
    );
  }
}

/*


// commonSizeBox(
          //   height: MediaQueryHelper.height * 10,
          // ),
          // Container(
          //   color: Colors.transparent,
          //   height: MediaQueryHelper.height * 90,
          //   width: MediaQueryHelper.width * double.infinity,
          //   child: footerForSignUpForm(),
          // )

 */
