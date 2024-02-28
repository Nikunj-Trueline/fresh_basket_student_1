import 'package:flutter/material.dart';
import '../../../constant/gradient.dart';

BottomNavigationBar bottomNavigationBarForHome(
    {void Function(int)? onTap, required int currentIndex}) {
  return BottomNavigationBar(
    selectedIconTheme: const IconThemeData(color: Colors.amber, size: 50),
    selectedLabelStyle:
        const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    unselectedIconTheme: const IconThemeData(
      color: Colors.amber,
      size: 30,
    ),
    //landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black87,
    selectedFontSize: 14,
    unselectedFontSize: 14,
    iconSize: 30,
    backgroundColor: primaryColor1,
    elevation: 5,
    onTap: onTap,
    currentIndex: currentIndex,
    items: [
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/icons/home1.png',
          height: 30,
          width: 30,
        ),
        label: "SHOP",
        backgroundColor: Colors.amber,
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/icons/search1.png',
          height: 30,
          width: 30,
        ),
        label: "EXPLORE",
        backgroundColor: Colors.amber,
      ),
      BottomNavigationBarItem(
          icon: Image.asset(
            'assets/icons/shoping1.png',
            height: 30,
            width: 30,
          ),
          label: "CART",
          backgroundColor: Colors.amber),
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/icons/heart.png',
          height: 30,
          width: 30,
        ),
        label: "FAVOURITE",
        backgroundColor: Colors.amber,
      ),
      BottomNavigationBarItem(
        label: "ACCOUNT",
        backgroundColor: Colors.amber,
        icon: Image.asset(
          'assets/icons/user1.png',
          height: 30,
          width: 30,
        ),
      ),
    ],
  );
}
