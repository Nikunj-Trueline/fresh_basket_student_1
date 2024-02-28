import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/screens/account/user_account_screen.dart';
import 'package:fresh_basket_mine/screens/cart/cart_screen.dart';
import 'package:fresh_basket_mine/screens/favourite/favourite_screen.dart';
import 'package:fresh_basket_mine/screens/home/home_screen.dart';
import 'package:fresh_basket_mine/screens/product/product_screen.dart';
import 'package:fresh_basket_mine/screens/product_detail/product_details_screen.dart';
import 'package:fresh_basket_mine/screens/serch/explore_screen.dart';
import 'package:fresh_basket_mine/screens/shop/shopping_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/signin/signin_screen.dart';
import '../screens/signup/sign_up_screen.dart';
import '../screens/splash/splash_screen.dart';

// create class for manage project routes..
class AppRoutes {
  static const splashScreen = '/splashScreen';
  static const onBoarding = '/onBoarding';
  static const signIn = '/signIn';
  static const signUp = '/signUp';
  static const home = '/home';
  static const shop = '/shop';
  static const explore = '/explore';
  static const cart = '/cart';
  static const favourite = '/favourite';
  static const account = '/account';
  static const product = '/product';
  static const productDetail = '/productDetail';

  // create route manage switch setting..
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );

      case signIn:
        return MaterialPageRoute(
          builder: (context) => const SignInScreen(),
        );

      case signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );

      case home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case shop:
        return MaterialPageRoute(
          builder: (context) => const ShoppingScreen(),
        );

      case explore:
        return MaterialPageRoute(
          builder: (context) => const ExploreScreen(),
        );

      case cart:
        return MaterialPageRoute(
          builder: (context) => const CartScreen(),
        );

      case favourite:
        return MaterialPageRoute(
          builder: (context) => const FavouriteScreen(),
        );

      case account:
        return MaterialPageRoute(
          builder: (context) => const UserAccountScreen(),
        );

      case product:
        return MaterialPageRoute(
          builder: (context) => const ProductScreen(),
        );

      case productDetail:
        return MaterialPageRoute(
          builder: (context) => const ProductDetailsScreen(),
        );
    }
    return null;
  }
}
