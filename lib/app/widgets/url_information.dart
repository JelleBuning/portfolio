import 'package:flutter/material.dart';
import 'package:portfolio/app/widgets/icon_url.dart';
import 'package:url_launcher/url_launcher.dart';

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
                descriptionWidget(description),
              ],
            ),
          ],
        ),
      ),
    );
  }

  descriptionWidget(String description) {
    return uri == null
        ? Text(description)
        : InkWell(
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            splashFactory: null,
            onTap: () => uri != null
                ? launchUrl(uri!, webOnlyWindowName: '_self')
                : null,
            hoverColor: Colors.transparent,
            child: Text(description),
          );
  }
}
