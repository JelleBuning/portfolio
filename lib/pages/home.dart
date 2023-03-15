import 'package:flutter/material.dart';
import 'package:flutter_portfolio/util/constants.dart';

import '../util/responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.OUTSIDE_PADDING),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Introduction
                Expanded(
                  flex: 3,
                  child: Row(children: [
                    Expanded(
                      flex: Responsive.isSmallScreen(context) ? 100 : 50,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                        ),
                        child: introductionWidget(),
                      ),
                    ),
                    // Only for alignment
                    Expanded(
                      flex: Responsive.isSmallScreen(context) ? 0 : 50,
                      child: const SizedBox.shrink()),
                  ]),
                ),
        
                // Content
                Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                          ),
                        ),
                      ),
                      // Only for alignment
                      const Expanded(child: SizedBox.shrink()),
                    ],
                  ),
                ),
              ],
          ),
          imageOverlay()
        ],
      ),
    );
  }
}

Widget introductionWidget(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text("Jelle Buning"),
      const Text("Software developer"),
      const SizedBox(height: 10),
      const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software."),
      const SizedBox(height: 10),
      socialMediaWidget()
    ],
  );
}

Widget socialMediaWidget(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: const [
    Icon(Icons.facebook),
    Icon(Icons.facebook),
    Icon(Icons.facebook),
  ],);
}

Widget imageOverlay(){
  // TODO: set image
  return const SizedBox(width: 400, height: 500);
}
