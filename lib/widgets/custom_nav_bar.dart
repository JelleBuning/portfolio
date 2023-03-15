import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/navigation_item.dart';
import 'package:flutter_portfolio/util/constants.dart';
import 'package:flutter_portfolio/util/responsive.dart';
import 'package:provider/provider.dart';

import '../util/theme_provider.dart';

class CustomNavigationBar extends StatefulWidget with PreferredSizeWidget{
  final BuildContext context;
  final List<NavigationItem> navigationItems;
  final int selectedId;
  final Function(int) callback;
  
  final Size size = const Size(double.infinity, 80.0);

  CustomNavigationBar({super.key, required this.context, required this.navigationItems, required this.selectedId, required this.callback});
  
  @override
  State<CustomNavigationBar> createState() => _CustomNavBarState();
  
  @override
  Size get preferredSize => size;
}

class _CustomNavBarState extends State<CustomNavigationBar> {
  bool isSwitched = false;


  @override
  Widget build(BuildContext context) {
    var menuPadding = 30.0;

    return PreferredSize(
      preferredSize: widget.size,
      child: Container(
        height: widget.size.height,
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Constants.OUTSIDE_PADDING),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Title/Logo placeholder"),
              Responsive.isSmallScreen(context)
                  ? getSmallNavBar(context, widget.navigationItems, widget.selectedId, widget.callback)
                  : getLargeNavBar(context, widget.navigationItems, widget.selectedId, widget.callback, menuPadding)
            ],
          ),
        ),
      ),
    );
  }

  Widget getSmallNavBar(BuildContext context, List<NavigationItem> navigationItems, int selectedId, Function(int) callback){
    return IconButton(
      onPressed: () {
        //TODO: open menu
      }, 
      icon: const Icon(Icons.menu),
    );
  }

  Widget getLargeNavBar(BuildContext context, List<NavigationItem> navigationItems, int selectedId, Function(int) callback, menuPadding){
    List<Padding> menuItems = 
    navigationItems.map((item) => 
        Padding(
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
        ),
      )
    .toList();

      // Add darkmode switch
    menuItems.add(
      Padding(
        padding: EdgeInsets.only(left: menuPadding), 
        child: const ThemeSwitchWidget(),
      ),
    );
    return Row( children: menuItems );
  } 
}

class ThemeSwitchWidget extends StatelessWidget{
  const ThemeSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
      activeColor: Colors.grey[700],
      activeTrackColor: Colors.grey[300],
      inactiveThumbColor: Colors.grey[700],
      inactiveTrackColor: Colors.grey,
      // ! to switch the values around in frontend
      value: !themeProvider.isDarkMode, 
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.setTheme(!value);
      },
    );
  }
  
}