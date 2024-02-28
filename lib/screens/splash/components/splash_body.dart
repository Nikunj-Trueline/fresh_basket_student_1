import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/prefrence/prefrence_sevicies.dart';
import '../../../constant/gradient.dart';
import '../../../routes/project_routes.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      if (PrefrenceServicies.getBool(PrefrenceServicies.isLoginKey)) {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      } else {
        if (PrefrenceServicies.getBool(PrefrenceServicies.isVisited)) {
          Navigator.pushReplacementNamed(context, AppRoutes.signIn);
        } else {
          Navigator.pushReplacementNamed(context, AppRoutes.onBoarding);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: splashBackgroundGradient,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('assets/images/splash_done.png',
                    height: 320, width: 320),
              ),
            ],
          )
        ],
      ),
    );
  }
}

/*

This is splash screen for introductions.
 */
