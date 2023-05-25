import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: introductionWidget(context),
    );
  }
}

Widget introductionWidget(BuildContext context){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("JELLE BUNING", style: Theme.of(context).textTheme.bodyLarge),
      Text("Software Developer", style: Theme.of(context).textTheme.headlineLarge,),
      Text("QUOTE", style: Theme.of(context).textTheme.bodyMedium,),
    ],
  );
}


