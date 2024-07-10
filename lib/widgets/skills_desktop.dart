import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/colors.dart';
import 'package:my_portfolio_website/constants/skill_items.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // platforms
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 450,
          ),
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              for (int i = 0; i < platformItems.length; i++)
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: CustomColor.bgLight2,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    leading: Image.asset(
                      platformItems[i]["img"],
                      width: 26,
                    ),
                    title: Text(platformItems[i]["title"]),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(
          width: 50.0,
        ),

        // skills
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: Column(
              children: [
                const Text(
                  "Programing Languages And Tools",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    for (int i = 0; i < skillItems.length; i++)
                      Chip(
                        backgroundColor: CustomColor.bgLight2,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 16.0,
                        ),
                        label: Text(skillItems[i]["title"]),
                        avatar: Image.asset(skillItems[i]["img"]),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 50.0,
        ),

        // operating systems
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: Column(
              children: [
                const Text(
                  "Operating Systems",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    for (int i = 0; i < operatingSystems.length; i++)
                      Chip(
                        backgroundColor: CustomColor.bgLight2,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 16.0,
                        ),
                        label: Text(operatingSystems[i]["title"]),
                        avatar: Image.asset(operatingSystems[i]["img"]),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
