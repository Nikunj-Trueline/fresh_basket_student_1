import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/screens/serch/components/explore_body.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return const ExploreBody();
  }
}
