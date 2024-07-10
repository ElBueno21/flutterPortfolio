import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/colors.dart';
import 'package:my_portfolio_website/constants/skill_items.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500.0,
      ),
      child: Column(
        children: [
          // platforms
          for (int i = 0; i < platformItems.length; i++)
            Container(
              margin: const EdgeInsets.only(
                bottom: 5.0,
              ),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: CustomColor.bgLight2,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                leading: Image.asset(
                  platformItems[i]["img"],
                  width: 26.0,
                ),
                title: Text(platformItems[i]["title"]),
              ),
            ),
          const SizedBox(
            height: 50.0,
          ),

          // skills
          Column(
            children: [
              const Text(
                "Programing Languages And Tools",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10.0),
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                alignment: WrapAlignment.center,
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
          const SizedBox(
            height: 50.0,
          ),
          // operating systems
          Column(
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
        ],
      ),
    );
  }
}
