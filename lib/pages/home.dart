import 'package:flutter/material.dart';
import 'package:flutter_portfolio/util/responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
  var screenSize = MediaQuery.of(context).size;
  var menuPadding = 15.0;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 70),
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Jelle Buning"),
                Responsive.isSmallScreen(context) ? Icon(Icons.menu) : Row(
                  children: [
                    Text("menu_item"),
                    SizedBox(width: menuPadding),
                    Text("menu_item"),
                    SizedBox(width: menuPadding),
                    Text("menu_item"),
                  ],
                ),
                
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        height: double.infinity, 
        width: double.infinity,
      ),
    );
  }
}