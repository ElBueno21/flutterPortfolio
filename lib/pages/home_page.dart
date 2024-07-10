import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/colors.dart';
import 'package:my_portfolio_website/constants/size.dart';
import 'package:my_portfolio_website/constants/sns_links.dart';
import 'package:my_portfolio_website/widgets/contact_section.dart';
import 'package:my_portfolio_website/widgets/drawer_mobile.dart';
import 'package:my_portfolio_website/widgets/footer.dart';
import 'package:my_portfolio_website/widgets/header_desktop.dart';
import 'package:my_portfolio_website/widgets/header_mobile.dart';
import 'package:my_portfolio_website/widgets/main_desktop.dart';
import 'package:my_portfolio_website/widgets/main_mobile.dart';
import 'package:my_portfolio_website/widgets/project_section.dart';
import 'package:my_portfolio_website/widgets/skills_desktop.dart';
import 'package:my_portfolio_website/widgets/skills_mobile.dart';

import 'dart:js' as js;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();

  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  void _scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: constraints.maxWidth >= kMinDesktopWidth
              ? null
              : DrawerMobile(
                  onNavItemTap: (int navIndex) {
                    scaffoldKey.currentState?.closeEndDrawer();
                    scrollToSection(navIndex);
                  },
                ),
          body: Stack(
            children: [
              SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      key: navbarKeys.first,
                    ),
                    // Main
                    if (constraints.maxWidth >= kMinDesktopWidth)
                      HeaderDesktop(
                        onNavMenuTap: (int navIndex) {
                          scrollToSection(navIndex);
                        },
                      )
                    else
                      HeaderMobile(
                        onLogoTap: () {},
                        onMenuTap: () {
                          scaffoldKey.currentState?.openEndDrawer();
                        },
                      ),

                    if (constraints.maxWidth >= kMinDesktopWidth)
                      MainDesktop(
                        scrollToContact: () => scrollToSection(3),
                      )
                    else
                      MainMobile(
                        scrollToContact: () => scrollToSection(3),
                      ),

                    // Skills
                    Container(
                      key: navbarKeys[1],
                      width: screenWidth,
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                      color: CustomColor.bgLight1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Title
                          const Text(
                            "What I can do",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: CustomColor.whitePrimary,
                            ),
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),

                          // platform and skills
                          if (constraints.maxWidth >= kMedDesktopWidth)
                            const SkillsDesktop()
                          else
                            const SkillsMobile()
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),

                    // Projects
                    ProjectSection(
                      key: navbarKeys[2],
                    ),

                    const SizedBox(
                      height: 30.0,
                    ),

                    // Contact
                    ContactSection(
                      key: navbarKeys[3],
                    ),
                    const SizedBox(
                      height: 100.0,
                    ),

                    // Footer
                    const Footer(),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: FloatingActionButton(
                  backgroundColor: CustomColor.brightGreen,
                  onPressed: _scrollToTop,
                  child: const Icon(
                    Icons.arrow_upward,
                    color: CustomColor.black,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      js.context.callMethod('open', [SnsLinks.blog]);
      return;
    }

    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
