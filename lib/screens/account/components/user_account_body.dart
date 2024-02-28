import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/mediaquery/media_query.dart';
import 'package:fresh_basket_mine/prefrence/prefrence_sevicies.dart';
import 'package:fresh_basket_mine/routes/project_routes.dart';
import 'package:fresh_basket_mine/screens/account/components/common_listtile.dart';
import '../../../common/common_sizebox.dart';
import 'custom_drawer.dart';
import 'logout_button.dart';

class UserAccountBody extends StatefulWidget {
  const UserAccountBody({super.key});

  @override
  State<UserAccountBody> createState() => _UserAccountBodyState();
}

class _UserAccountBodyState extends State<UserAccountBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(size: 40, color: Colors.black),
        ),
        body: Center(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    //  gradient: accountScreenBackground,
                    ),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQueryHelper.height * 1000,
                  width: MediaQueryHelper.width * double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CommonSizeBox(height: 20),
                      commonDivider(),
                      commonLisTile(
                          iconPath: "assets/icons/i1.svg",
                          onPressed: () {},
                          text: "Orders"),
                      commonDivider(),
                      commonLisTile(
                          iconPath: "assets/icons/i2.svg",
                          onPressed: () {},
                          text: "My Details"),
                      commonDivider(),
                      commonLisTile(
                          iconPath: "assets/icons/i3.svg",
                          onPressed: () {},
                          text: "Delivery Address"),
                      commonDivider(),
                      commonLisTile(
                          iconPath: "assets/icons/i4.svg",
                          onPressed: () {},
                          text: "Payment Method"),
                      commonDivider(),
                      commonLisTile(
                          iconPath: "assets/icons/i5.svg",
                          onPressed: () {},
                          text: "Promo Cord"),
                      commonDivider(),
                      commonLisTile(
                          iconPath: "assets/icons/i6.svg",
                          onPressed: () {},
                          text: "Notification"),
                      commonDivider(),
                      commonLisTile(
                          iconPath: "assets/icons/i7.svg",
                          onPressed: () {},
                          text: "Help"),
                      commonDivider(),
                      commonLisTile(
                          iconPath: "assets/icons/i8.svg",
                          onPressed: () {},
                          text: "About"),
                      const CommonSizeBox(height: 40),
                      CustomButtonForLogout(
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();

                            if (!context.mounted) return;
                            Navigator.pushNamedAndRemoveUntil(
                                context, AppRoutes.signIn, (route) => false);

                            PrefrenceServicies.setData(
                                PrefrenceServicies.isLoginKey, false);
                          },
                          data: "L O G O U T ",
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        drawer: const CustomDrawerForHome(),
      ),
    );
  }
}

Widget commonDivider() {
  return const Padding(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: Divider(
      height: 26,
      color: Colors.black26,
      thickness: 1,
    ),
  );
}

/*
   commonSizeBox(height: 60),
                  const CustomDrawer(),
 */
