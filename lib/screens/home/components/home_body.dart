import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/screens/account/user_account_screen.dart';
import 'package:fresh_basket_mine/screens/cart/cart_screen.dart';
import 'package:fresh_basket_mine/screens/favourite/favourite_screen.dart';
import 'package:fresh_basket_mine/screens/home/components/bottomnavigationbar_home.dart';
import 'package:fresh_basket_mine/screens/serch/explore_screen.dart';
import '../../shop/shopping_screen.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int currentIndex = 0;

  List<Widget> screens = [
    const ShoppingScreen(),
    const ExploreScreen(),
    const CartScreen(),
    const FavouriteScreen(),
    const UserAccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: screens[currentIndex],
      bottomNavigationBar: bottomNavigationBarForHome(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          }),
    );
  }
}
