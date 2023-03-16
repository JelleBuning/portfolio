import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/navigation_item.dart';
import 'package:flutter_portfolio/util/constants.dart';
import 'package:flutter_portfolio/util/responsive.dart';
import 'package:provider/provider.dart';
import '../util/theme_provider.dart';

class CustomNavigationBar extends StatefulWidget with PreferredSizeWidget {
  final BuildContext context;
  final List<NavigationItem> navigationItems;
  final int selectedId;
  final Function(int) callback;
  final Function(bool) menuCallback;
  final bool mobileMenuOpen;

  final Size size = const Size(double.infinity, Constants.APPBAR_PREFERRED_SIZE);

  CustomNavigationBar(
      {super.key,
      required this.context,
      required this.navigationItems,
      required this.selectedId,
      required this.callback,
      required this.menuCallback, 
      required this.mobileMenuOpen});

  @override
  State<CustomNavigationBar> createState() => _CustomNavBarState();

  @override
  Size get preferredSize => size;
}

class _CustomNavBarState extends State<CustomNavigationBar>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: Constants.MENU_ANIMATION_DURATION_MS
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    updateIcon();

    return PreferredSize(
      preferredSize: widget.size,
      child: Container(
        height: widget.size.height,
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding:
              const EdgeInsets.fromLTRB(Constants.OUTSIDE_PADDING, Constants.STATUSBAR_PADDING, Constants.OUTSIDE_PADDING, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Title/Logo placeholder"),
              Responsive.isSmallScreen(context)
                  ? getSmallNavBar(context, widget.navigationItems,
                      widget.selectedId, widget.callback)
                  : getLargeNavBar(context, widget.navigationItems,
                      widget.selectedId, widget.callback)
            ],
          ),
        ),
      ),
    );
  }

  Widget getSmallNavBar(
      BuildContext context,
      List<NavigationItem> navigationItems,
      int selectedId,
      Function(int) callback) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close, 
        progress: animationController
      ),
      onPressed: () {
        toggleicon();
      },
    );
  }

  Widget getLargeNavBar(
      BuildContext context,
      List<NavigationItem> navigationItems,
      int selectedId,
      Function(int) callback) {
    List<Padding> menuItems = navigationItems
        .map(
          (item) => Padding(
            padding: const EdgeInsets.only(left: Constants.MENU_PADDING),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0, shadowColor: Colors.transparent),
              child: item.id == selectedId
                  ? Text(item.name,
                      style: const TextStyle(fontWeight: FontWeight.bold))
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
      const Padding(
        padding: EdgeInsets.only(left: Constants.MENU_PADDING),
        child: ThemeSwitchWidget(),
      ),
    );
    return Row(children: menuItems);
  }

  void toggleicon() => setState(() {
        updateIcon();
        widget.menuCallback(!widget.mobileMenuOpen);
      });

  void updateIcon() {
    widget.mobileMenuOpen ? animationController.forward() : animationController.reverse();
  }

}
class ThemeSwitchWidget extends StatelessWidget {
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
