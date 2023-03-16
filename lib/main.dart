import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/navigation_item.dart';
import 'package:flutter_portfolio/pages/about.dart';
import 'package:flutter_portfolio/pages/home.dart';
import 'package:flutter_portfolio/util/constants.dart';
import 'package:flutter_portfolio/util/theme_provider.dart';
import 'package:flutter_portfolio/widgets/custom_nav_bar.dart';
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
  bool menuOpen = false;
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
                      callback: (value) => setState(
                        () {
                          selectedPage = value;
                        },
                      ),
                      menuCallback: (value) => setState(() {
                        menuOpen = value;
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
                        AnimatedContainer(
                          color: Theme.of(context).primaryColor,
                          alignment: Alignment.topCenter,
                          width: double.infinity,
                          height:
                              menuOpen ? MediaQuery.of(context).size.height : 0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn,
                          child: menuOpen ? getSmallMenu() : null,
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

  Widget getSmallMenu(){
    return FutureBuilder(
      future: delayBuild(250),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return smallMenu();
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

  Widget smallMenu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.OUTSIDE_PADDING),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            MenuItem(title: "HOME"),
            SizedBox(height: 10,),
            MenuItem(title: "ABOUT"),
          ],
        ),
    );
  }
}

class MenuItem extends StatefulWidget {
  const MenuItem({
    super.key, required this.title,
  });
  final String title;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        border: Border.all(
          color:  _hovering ? Colors.white : Colors.transparent
          ),
        ),
      child: InkWell(
        onTap: () {},
        onHover: (hovering) {
          setState(() {
            _hovering = hovering; 
          });
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          child: Text(widget.title),
        ),
      ),
    );
  }
}
