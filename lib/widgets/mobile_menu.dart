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

class _MobileMenuState extends State<MobileMenu> with SingleTickerProviderStateMixin {
  
  final List<Interval> itemSlideIntervals = [];
  static const staggerTime = Duration(milliseconds: 50);
  static const itemSlideTime = Duration(milliseconds: 200);
  late Duration animationDuration = Duration(milliseconds: ((staggerTime.inMilliseconds + itemSlideTime.inMilliseconds) * widget.navigationItems.length));
  late AnimationController animationController = AnimationController(vsync: this, duration: animationDuration);

  @override
  void initState() {
    super.initState();
    createAnimationIntervals();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

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
    animationController.forward();
    List<AnimatedBuilder> menuItems = navigationItems.map(
      (item) => AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          final animationPercent = Curves.easeOut.transform(
            itemSlideIntervals[item.id].transform(animationController.value),
          );
          final opacity = animationPercent;
          final slideDistance = (1.0 - animationPercent) * 150;

          return Opacity(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(slideDistance, 0),
              child: child,
            ),
          );
        },
        child: MobileMenuItem(item: item, callback: (var id) {
          widget.callback(id);
        },),
      ),
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
  
  void createAnimationIntervals() {
    for (var i = 0; i < widget.navigationItems.length; ++i) {
      final startTime = (staggerTime * i);
      final endTime = startTime + itemSlideTime;
      itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / animationDuration.inMilliseconds,
          endTime.inMilliseconds / animationDuration.inMilliseconds,
        ),
      );
    }
  }
}
