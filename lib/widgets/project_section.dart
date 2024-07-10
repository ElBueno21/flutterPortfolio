import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/colors.dart';
import 'package:my_portfolio_website/utils/project_utils.dart';
import 'package:my_portfolio_website/widgets/project_card.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          // work projects title
          const Text(
            "Work Projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),

          // work projects cards
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 900.0,
            ),
            child: Wrap(
              spacing: 25.0,
              runSpacing: 25.0,
              children: [
                for (int i = 0; i < workProjectUtils.length; i++)
                  ProjectCardWidget(
                    project: workProjectUtils[i],
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 80.0,
          ),
          // hooby projects title
          const Text(
            "Hobby Projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),

          // hobby projects cards
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 900.0,
            ),
            child: Wrap(
              spacing: 25.0,
              runSpacing: 25.0,
              children: [
                for (int i = 0; i < hobbyProjectUtils.length; i++)
                  ProjectCardWidget(
                    project: hobbyProjectUtils[i],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
