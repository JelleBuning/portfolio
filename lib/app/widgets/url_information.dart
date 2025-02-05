import 'package:flutter/material.dart';
import 'package:portfolio/app/widgets/icon_url.dart';

class UrlInformation extends StatelessWidget {
  const UrlInformation({
    super.key,
    required this.asset,
    required this.title,
    required this.description,
    this.uri,
  });

  final String asset;
  final String title;
  final String description;
  final Uri? uri;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      child: SizedBox(
        width: 350,
        child: Row(
          spacing: 15,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(10),
                borderRadius: BorderRadius.all(Radius.circular(7.5)),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: IconUrl(
                    asset: asset,
                    color: Theme.of(context).colorScheme.primary,
                    uri: uri,
                  )),
            ),
            Column(
              spacing: 3,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    color:
                        Theme.of(context).colorScheme.onPrimary.withAlpha(100),
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(description),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
