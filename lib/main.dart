import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/navigation_item.dart';
import 'package:flutter_portfolio/pages/about.dart';
import 'package:flutter_portfolio/pages/home.dart';
import 'package:flutter_portfolio/util/constants.dart';
import 'package:flutter_portfolio/util/theme_provider.dart';
import 'package:flutter_portfolio/widgets/custom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool? isDark = sharedPreferences.getBool(Constants.THEME_KEY);
  runApp(App(isDark: (isDark == null) ? true : isDark));
}

class App extends StatefulWidget {
  const App({super.key, required this.isDark});
  final bool isDark;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int selectedPage = 0;
  List<NavigationItem> navigationItems = [
    NavigationItem(0, "Home", const HomePage()),
    NavigationItem(1, "About", const AboutPage()),
  ];
  
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ThemeProvider(widget.isDark),
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
              appBar: CustomNavigationBar(
                context: context,
                navigationItems: navigationItems,
                selectedId: selectedPage,
                callback: (value) => setState(
                        () {
                          selectedPage = value;
                        },
                      )),
              body: Container(
                color: Theme.of(context).colorScheme.primary,
                height: double.infinity,
                width: double.infinity,
                child: getPage(selectedPage),
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