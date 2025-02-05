import 'package:flutter/material.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            Theme.of(context).colorScheme.onPrimary.withAlpha(7),
            Theme.of(context).colorScheme.onPrimary.withAlpha(12),
            Theme.of(context).colorScheme.onPrimary.withAlpha(35),
          ],
        ),
      ),
      height: 120,
      width: 120,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 12.5),
          child: child,
        ),
      ),
    );
  }
}
