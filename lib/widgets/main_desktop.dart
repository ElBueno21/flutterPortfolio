import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/colors.dart';

class MainDesktop extends StatelessWidget {
  final VoidCallback scrollToContact;

  const MainDesktop({super.key, required this.scrollToContact});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(minHeight: 350.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Hello,\nI'm Miguel Bueno Nunez\nA Software Engineer",
                  style: TextStyle(
                    fontSize: 30.0,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary,
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    onPressed: scrollToContact,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.yellowAccent,
                      backgroundColor:
                          CustomColor.brightGreen, // Background color
                      padding:
                          const EdgeInsets.symmetric(vertical: 15), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30), // Rounded corners
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
          Image.asset(
            "assets/self.jpg",
            width: screenWidth / 2,
            height: 500,
          ),
        ],
      ),
    );
  }
}
