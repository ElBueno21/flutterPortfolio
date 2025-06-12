import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key, required this.scrollToContact});
  final VoidCallback scrollToContact;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 30.0,
        ),
        constraints: const BoxConstraints(minHeight: 560.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // avatar img
            ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: [
                    CustomColor.scaffoldBg.withAlpha((0.6 * 255).toInt()),
                    CustomColor.scaffoldBg.withAlpha((0.6 * 255).toInt()),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ).createShader(
                  Rect.fromLTRB(0, 0, bounds.width, bounds.height),
                );
              },
              blendMode: BlendMode.srcATop,
              child: Image.asset(
                "assets/self.jpg",
                width: screenWidth,
                height: 500,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "Hello,\nI'm Miguel Bueno Nunez\nA Software Engineer",
              style: TextStyle(
                fontSize: 24.0,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary,
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: 250.0,
              child: ElevatedButton(
                onPressed: scrollToContact,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.yellowAccent,
                  backgroundColor: CustomColor.brightGreen, // Background color
                  padding: const EdgeInsets.symmetric(vertical: 15), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                ),
                child: const Text(
                  "Contact Me",
                  style: TextStyle(
                    color: CustomColor.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
