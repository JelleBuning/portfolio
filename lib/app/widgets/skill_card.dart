import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SkillCard extends StatefulWidget {
  const SkillCard({
    super.key,
    required this.child,
    this.color,
    this.uri,
  });

  final Widget child;
  final Color? color;
  final Uri? uri;

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    double size = 120;
    return InkWell(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      splashFactory: null,
      onTap: () {
        if (widget.uri != null) {
          launchUrl(widget.uri!);
        }
      },
      onHover: (value) {
        setState(() {
          hovering = value;
        });
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
              hovering ? Colors.transparent : Colors.white, BlendMode.color),
          child: Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: widget.color ?? Color.fromARGB(255, 36, 41, 56),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
