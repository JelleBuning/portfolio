import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/navigation_item.dart';
import 'package:flutter_portfolio/util/responsive.dart';

PreferredSizeWidget customNavigationBar(
    BuildContext context,
    List<NavigationItem> navigationItems,
    int selectedId,
    Function(int) callback) {
  var menuPadding = 30.0;
  var navHeight = 80.0;

  return PreferredSize(
    preferredSize: Size(double.infinity, navHeight),
    child: Container(
      height: navHeight,
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Jelle Buning"),
            Responsive.isSmallScreen(context)
                ? const Icon(Icons.menu)
                : Row(
                    children: navigationItems
                        .map((item) => Padding(
                              padding: EdgeInsets.only(left: menuPadding),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    shadowColor: Colors.transparent),
                                child: item.id == selectedId
                                    ? Text(item.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold))
                                    : Text(item.name),
                                onPressed: () {
                                  callback(item.id);
                                },
                              ),
                            ))
                        .toList())
          ],
        ),
      ),
    ),
  );
}
