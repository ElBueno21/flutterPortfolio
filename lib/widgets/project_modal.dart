import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/colors.dart';
import 'package:my_portfolio_website/utils/project_utils.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectModal extends StatefulWidget {
  final ProjectUtils project;

  const ProjectModal({super.key, required this.project});

  @override
  State<ProjectModal> createState() => _ProjectModalState();
}

class _ProjectModalState extends State<ProjectModal> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _nextPage() {
    if (_currentPage < widget.project.images.length - 1) {
      _pageController.animateToPage(_currentPage + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      setState(() {
        _currentPage++;
      });
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(_currentPage - 1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            Text(
              widget.project.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 10.0),
            // subtitle or moreInfo text
            (widget.project.moreInfo == null ||
                    widget.project.moreInfo!.isEmpty)
                ? Text(
                    widget.project.subtitle,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  )
                : Text(
                    widget.project.moreInfo!,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
            const SizedBox(height: 10.0),
            Expanded(
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: widget.project.images.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  PhotoView(
                                    imageProvider: AssetImage(
                                        widget.project.images[index]),
                                    minScale: PhotoViewComputedScale.contained,
                                    maxScale:
                                        PhotoViewComputedScale.covered * 2,
                                    backgroundDecoration: BoxDecoration(
                                      color: Theme.of(context).canvasColor,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        "Close",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: PhotoView(
                          imageProvider:
                              AssetImage(widget.project.images[index]),
                          minScale: PhotoViewComputedScale.contained,
                          maxScale: PhotoViewComputedScale.covered * 2,
                          backgroundDecoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                          ),
                        ),
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                  ),
                  if (_currentPage > 0)
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: _previousPage,
                      ),
                    ),
                  if (_currentPage < widget.project.images.length - 1)
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: _nextPage,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                alignment: WrapAlignment.center,
                children: [
                  if (widget.project.androidLink != null)
                    ElevatedButton(
                      onPressed: () async {
                        final url = Uri.parse(widget.project.androidLink!);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url,
                              mode: LaunchMode.externalApplication);
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/android_icon.png',
                            width: 25.0,
                          ),
                          const SizedBox(width: 8.0),
                          const Text(
                            "Android Link",
                            style: TextStyle(
                              color: CustomColor.whitePrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (widget.project.iosLink != null)
                    ElevatedButton(
                      onPressed: () async {
                        final url = Uri.parse(widget.project.iosLink!);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url,
                              mode: LaunchMode.externalApplication);
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/ios_icon.png',
                            width: 25.0,
                          ),
                          const SizedBox(width: 8.0),
                          const Text(
                            "iOS Link",
                            style: TextStyle(
                              color: CustomColor.whitePrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (widget.project.webLink != null)
                    ElevatedButton(
                      onPressed: () async {
                        final url = Uri.parse(widget.project.webLink!);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url,
                              mode: LaunchMode.externalApplication);
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/web_icon.png',
                            width: 25.0,
                          ),
                          const SizedBox(width: 8.0),
                          const Text(
                            "Web Link",
                            style: TextStyle(
                              color: CustomColor.whitePrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Close",
                  style: TextStyle(
                    color: CustomColor.whitePrimary,
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
