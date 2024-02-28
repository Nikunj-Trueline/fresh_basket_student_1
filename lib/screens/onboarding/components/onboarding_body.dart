import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/prefrence/prefrence_sevicies.dart';
import '../../../common/common_sizebox.dart';
import '../../../mediaquery/media_query.dart';
import '../../../model/onboarding.dart';
import '../../../routes/project_routes.dart';
import 'customrow_onboarding.dart';
import 'customtext_onboarding.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  List<OnBoardingClass> onBoardingData = [
    OnBoardingClass(
        title: "ONLINE SHOPPING",
        image: "assets/images/onboarding1.png",
        description: 'YOU CAN SHOPPING ANYTIME , ANYWHERE THAT YOU WANT'),
    OnBoardingClass(
        title: "MULTIPLE PAYMENT SYSTEM",
        image: "assets/images/onboarding2.png",
        description: 'YOU CAN USE MULTI-TYPES OF PAYMENT SYSTEM.'),
    OnBoardingClass(
        title: "FREE SHIPPING AT YOUR HOME ",
        image: "assets/images/onboarding3.png",
        description: ' PRODUCTS YOU ORDER WILL BE DELIVERED TO YOUR ADDRESS'),
  ];

  int currentIndex = 0;

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: MediaQueryHelper.height * 800,
            child: PageView.builder(
              controller: _pageController,
              itemCount: onBoardingData.length,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 20, top: 30, right: 20, bottom: 20),
                          child: Image.asset(onBoardingData[index].image),
                        ),
                      ),
                      CommonSizeBox(height: MediaQueryHelper.height * 30),
                      customTextForOnboarding(
                        text: onBoardingData[index].title,
                        textAlign: TextAlign.center,
                        fontFamily: 'onBoarding',
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                      ),
                      CommonSizeBox(height: MediaQueryHelper.height * 40),
                      customTextForOnboarding(
                        text: onBoardingData[index].description,
                        textAlign: TextAlign.center,
                        fontFamily: 'onBoarding',
                        fontSize: 30,
                        color: Colors.black54,
                        fontWeight: FontWeight.w800,
                      ),
                      CommonSizeBox(height: MediaQueryHelper.height * 40),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                customRow(currentIndex: currentIndex),
                CommonSizeBox(height: MediaQueryHelper.width * 20),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (currentIndex < onBoardingData.length - 1) {
                        currentIndex++;
                        _pageController.animateToPage(
                          currentIndex,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear,
                        );
                      } else {
                        PrefrenceServicies.setData(
                            PrefrenceServicies.isVisited, true);

                        Navigator.pushReplacementNamed(
                            context, AppRoutes.signIn);
                      }
                    });
                  },
                  backgroundColor: Colors.amber.shade400,
                  child: const Icon(Icons.navigate_next, size: 35),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
