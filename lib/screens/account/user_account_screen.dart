import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/screens/account/components/user_account_body.dart';

class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({super.key});

  @override
  State<UserAccountScreen> createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return const UserAccountBody();
  }
}
