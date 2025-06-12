import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/colors.dart';
import 'package:my_portfolio_website/utils/project_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio_website/widgets/project_modal.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
    required this.project,
  });

  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => ProjectModal(project: project),
        );
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 320.0,
        width: 260.0,
        decoration: BoxDecoration(
          color: CustomColor.bgLight2,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // project img
            Image.asset(
              project.images.first,
              height: 140.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            // title
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
              child: Text(
                project.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
            // subtitle
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Text(
                project.subtitle,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 10.0,
                  color: CustomColor.whitePrimary,
                ),
              ),
            ),
            const Spacer(),
            // footer
            Container(
              color: CustomColor.bgLight1,
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 10.0,
              ),
              child: Row(
                children: [
                  const Text(
                    "Available on: ",
                    style: TextStyle(
                      color: CustomColor.brightGreen,
                      fontSize: 10.0,
                    ),
                  ),
                  const Spacer(),
                  if (project.iosLink != null)
                    InkWell(
                      onTap: () async {
                        final url = Uri.parse(project.iosLink!);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url,
                              mode: LaunchMode.externalApplication);
                        }
                      },
                      child: Image.asset(
                        "assets/ios_icon.png",
                        width: 19,
                      ),
                    ),
                  if (project.androidLink != null)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 6.0,
                      ),
                      child: InkWell(
                        onTap: () async {
                          final url = Uri.parse(project.androidLink!);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url,
                                mode: LaunchMode.externalApplication);
                          }
                        },
                        child: Image.asset(
                          "assets/android_icon.png",
                          width: 17,
                        ),
                      ),
                    ),
                  if (project.webLink != null)
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 6.0,
                      ),
                      child: InkWell(
                        onTap: () async {
                          final url = Uri.parse(project.webLink!);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url,
                                mode: LaunchMode.externalApplication);
                          }
                        },
                        child: Image.asset(
                          "assets/web_icon.png",
                          width: 17,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
