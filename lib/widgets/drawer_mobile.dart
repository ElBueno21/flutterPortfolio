import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/colors.dart';
import 'package:my_portfolio_website/constants/nav_items.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key, required this.onNavItemTap});
  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.scaffoldBg,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 20.0,
                  left: 20.0,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: CustomColor.whitePrimary,
                    size: 30,
                  ),
                ),
              ),
            ),
            for (int i = 0; i < navIcons.length && i < navTitles.length; i++)
              ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                ),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                  onNavItemTap(i);
                },
                leading: Icon(
                  navIcons[i],
                  color: CustomColor.whitePrimary,
                ),
                title: Text(
                  navTitles[i],
                  style: const TextStyle(
                    color: CustomColor.whitePrimary,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
