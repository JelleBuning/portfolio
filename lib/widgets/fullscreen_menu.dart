import 'package:flutter/material.dart';
import '../util/constants.dart';

class FullscreenMenu extends StatelessWidget {
  const FullscreenMenu({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: size,
        child: Container(
          height: size.height,
          color: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Constants.OUTSIDE_PADDING),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox.shrink(),
                IconButton(
                    onPressed: () {
                      //TODO: navigate back
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(child: Text("menu")),
    );
  }
}
