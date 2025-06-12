import 'package:flutter/material.dart';
import 'package:my_portfolio_website/constants/colors.dart';
import 'package:my_portfolio_website/constants/size.dart';
import 'package:my_portfolio_website/constants/sns_links.dart';
import 'package:my_portfolio_website/widgets/custom_text_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendEmail() async {
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String message = _messageController.text;

    final Uri uri = Uri.parse('https://flutter-email.zephyrus.site/send-email');

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'name': name,
        'email': email,
        'message': message,
      }),
    );

    if (response.statusCode == 200) {
      // Handle successful response
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email sent successfully')),
        );
      }
    } else {
      // Handle error response
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to send email')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          // title
          const Text(
            "Get In Touch",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: CustomColor.whitePrimary,
            ),
          ),

          const SizedBox(
            height: 50.0,
          ),

          ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 700.0,
                maxHeight: 100.0,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth >= kMinDesktopWidth) {
                    return buildNameEmailFieldDesktop();
                  }
                  // else
                  return buildNameEmailFieldMobile();
                },
              )),
          const SizedBox(
            height: 15.0,
          ),
          // message
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700.0,
            ),
            child: CustomTextField(
              controller: _messageController,
              hintText: "Your Message",
              maxLines: 16,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          // send btn
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700.0,
            ),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.yellowAccent,
                  backgroundColor: CustomColor.brightGreen, // Background color
                  padding: const EdgeInsets.symmetric(vertical: 15), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                ),
                onPressed: _sendEmail,
                child: const Text(
                  "Get In Touch",
                  style: TextStyle(
                    color: CustomColor.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),

          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300.0,
            ),
            child: const Divider(
              color: CustomColor.bgLight2,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          // SNS icon btn links
          Wrap(
            spacing: 12.0,
            runSpacing: 12.0,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  final url = Uri.parse(SnsLinks.github);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }
                },
                child: Image.asset("assets/github.png", width: 28.0),
              ),
              InkWell(
                onTap: () async {
                  final url = Uri.parse(SnsLinks.linkedIn);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }
                },
                child: Image.asset("assets/linkedin.png", width: 28.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row buildNameEmailFieldDesktop() {
    return Row(
      children: [
        // name
        Flexible(
          child: CustomTextField(
            controller: _nameController,
            hintText: "Your Name",
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        // email
        Flexible(
          child: CustomTextField(
            controller: _emailController,
            hintText: "Your Email",
          ),
        ),
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        // name
        Flexible(
          child: CustomTextField(
            controller: _nameController,
            hintText: "Your Name",
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        // email
        Flexible(
          child: CustomTextField(
            controller: _emailController,
            hintText: "Your Email",
          ),
        ),
      ],
    );
  }
}
