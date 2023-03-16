import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/navigation_item.dart';
import 'package:flutter_portfolio/pages/about.dart';
import 'package:flutter_portfolio/pages/home.dart';
import 'package:flutter_portfolio/util/theme_provider.dart';
import 'package:flutter_portfolio/widgets/navigation_bar.dart';
import 'package:flutter_portfolio/widgets/mobile_menu.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  int selectedPage = 0;
  bool mobileMenuOpen = false;
  List<NavigationItem> navigationItems = [
    NavigationItem(0, "Home", const HomePage()),
    NavigationItem(1, "About", const AboutPage()),
  ];

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          var themeProvider = Provider.of<ThemeProvider>(context);
          return DefaultTabController(
            length: 3,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Jelle Buning',
              themeMode: themeProvider.themeMode,
              theme: themeProvider.lightTheme,
              darkTheme: themeProvider.darkTheme,
              //try remove this builder and use above
              home: Builder(
                builder: (context) {
                  return Scaffold(
                    backgroundColor: Theme.of(context).primaryColor,
                    appBar: CustomNavigationBar(
                      context: context,
                      navigationItems: navigationItems,
                      selectedId: selectedPage,
                      mobileMenuOpen: mobileMenuOpen,
                      callback: (value) => setState(
                        () {
                          selectedPage = value;
                        },
                      ),
                      menuCallback: (value) => setState(() {
                        mobileMenuOpen = value;
                      }),
                    ),
                    body: Stack(
                      children: [
                        Container(
                          color: Theme.of(context).colorScheme.primary,
                          height: double.infinity,
                          width: double.infinity,
                          child: getPage(selectedPage),
                        ),
                        // Small menu panel
                        AnimatedContainer(
                          color: Theme.of(context).primaryColorLight,
                          alignment: Alignment.topCenter,
                          width: double.infinity,
                          height: mobileMenuOpen ? MediaQuery.of(context).size.height : 0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn,
                          child: mobileMenuOpen ? 
                          MobileMenu(
                            navigationItems: navigationItems, 
                            selectedId: selectedPage, 
                            callback: (value) => setState(() {
                                mobileMenuOpen = false;
                                selectedPage = value;
                              },
                            ),
                          ) 
                          : null,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      );

  Widget getPage(int id) {
    var selectedPage =
        navigationItems.firstWhere((element) => element.id == id);
    return selectedPage.widget;
  }
}
