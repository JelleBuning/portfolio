import 'dart:html' as html; // ignore: avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';
import 'package:portfolio/app/contact_card.dart';
import 'package:portfolio/app/content.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double verticalSpacing = 20;
  final double horizontalSpacing = 80;
  final double minCardWidth = 350;
  final double minContentWidth = 600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () =>
            Future.delayed(Duration(seconds: 1), () => setState(() {})),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              spacing: 10,
              children: [
                isWindowsClient() ? header() : SizedBox.shrink(),
                LayoutBuilder(
                  builder: (context, constraints) {
                    var isMobile = constraints.maxWidth <= 1050;
                    if (isMobile) {
                      // mobile layout
                      return Column(
                        spacing: 20,
                        children: [
                          ContactCard(isMobile: isMobile),
                          Content(isMobile: isMobile),
                        ],
                      );
                    }
                    // tablet/desktop layout
                    return ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 1200),
                      child: Row(
                        spacing: 40,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ContactCard(
                            isMobile: isMobile,
                          ),
                          Expanded(
                            child: Content(isMobile: isMobile),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isWindowsClient() {
    String userAgent = html.window.navigator.userAgent.toLowerCase();
    return userAgent.contains('windows') ||
        userAgent.contains('win32') ||
        userAgent.contains('win64') ||
        userAgent.contains('wow64');
  }

  Align header() {
    return Align(
      alignment: Alignment.topRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            style: FilledButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            ),
            child: Text('help'),
            onPressed: () async => await _launchUrl(Uri.parse('download')),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
