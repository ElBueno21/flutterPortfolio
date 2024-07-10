import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50.0),
      width: double.maxFinite,
      alignment: Alignment.center,
      child: const Text(
        "Made By Miguel Bueno Nunez with Flutter 3.22.2",
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w400,
          color: CustomColor.whiteSecondary,
        ),
      ),
    );
  }
}
