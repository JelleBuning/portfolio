import 'package:flutter/material.dart';

import '../model/navigation_item.dart';
import '../util/constants.dart';
import 'mobile_menu_item.dart';

class MobileMenu extends StatefulWidget {
  const MobileMenu({super.key, required this.navigationItems, required this.selectedId, required this.callback});
  
  final List<NavigationItem> navigationItems;
  final int selectedId;
  final Function(int) callback;

  @override
  State<MobileMenu> createState() => _MobileMenuState();
}

class _MobileMenuState extends State<MobileMenu> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: delayBuild(250),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return getMenuItems(widget.navigationItems);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Future<bool> delayBuild(var ms) async{
    await Future.delayed(Duration(milliseconds: ms));
    return true;
  }

  Widget getMenuItems(List<NavigationItem> navigationItems) {
    List<MobileMenuItem> menuItems = navigationItems.map(
      (item) => MobileMenuItem(item: item, callback: (var id) {
        widget.callback(id);
      },)
    )
    .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.OUTSIDE_PADDING),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: menuItems 
        ),
    );
  }
}
