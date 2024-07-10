import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/colors.dart';
import 'package:my_portfolio_website/styles/style.dart';
import 'package:my_portfolio_website/widgets/site_logo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
      decoration: kHeaderDecoration,
      width: double.maxFinite,
      child: Row(
        children: [
          SiteLogo(onTap: onLogoTap),
          const Spacer(),
          IconButton(
            onPressed: onMenuTap,
            icon: const Icon(
              Icons.menu,
              color: CustomColor.whitePrimary,
              size: 30,
            ),
          ),
          const SizedBox(width: 15.0),
        ],
      ),
    );
  }
}
