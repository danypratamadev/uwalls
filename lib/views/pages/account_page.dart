import 'package:flutter/material.dart';
import 'package:uwalls/shared/interfaces/text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Headline2Text(label: 'Account'),
      ),
    );
  }
}