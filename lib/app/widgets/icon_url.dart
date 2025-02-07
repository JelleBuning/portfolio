import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class IconUrl extends StatefulWidget {
  const IconUrl({
    super.key,
    required this.asset,
    this.uri,
    this.newTab = true,
    this.color,
    this.hoverColor,
    this.size = 20,
  });

  final Uri? uri;
  final bool newTab;
  final String asset;
  final double size;
  final Color? color;
  final Color? hoverColor;

  @override
  State<IconUrl> createState() => _IconUrlState();
}

class _IconUrlState extends State<IconUrl> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return widget.uri == null
        ? getPicture(context)
        : InkWell(
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            splashFactory: null,
            onTap: () => launchUrl(
              widget.uri!,
              webOnlyWindowName: widget.newTab ? '_blank' : '_self',
            ),
            hoverColor: Colors.transparent,
            onHover: (value) {
              setState(() {
                hovering = value;
              });
            },
            child: getPicture(context),
          );
  }

  SvgPicture getPicture(BuildContext context) {
    return SvgPicture.asset(
      colorFilter: ColorFilter.mode(
        widget.color ??
            Theme.of(context)
                .colorScheme
                .onPrimary
                .withAlpha(hovering ? 200 : 110),
        BlendMode.srcIn,
      ),
      width: widget.size,
      widget.asset,
    );
  }
}
