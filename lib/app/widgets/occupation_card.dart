import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OccupationCard extends StatelessWidget {
  const OccupationCard({
    super.key,
    required this.asset,
    required this.isMobile,
    required this.assetHeight,
    required this.title,
    required this.description,
  });

  final bool isMobile;
  final String asset;
  final double assetHeight;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
          child: Row(
            spacing: 10,
            children: [
              SizedBox(
                width: 60,
                child: SvgPicture.asset(
                  asset,
                  height: assetHeight,
                ),
              ),
              Expanded(
                // Wrap the Column in an Expanded widget
                child: Column(
                  spacing: 3,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        // Added const here
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        overflow: TextOverflow.clip,
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withAlpha(225),
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
