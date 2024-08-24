import 'package:app2/components/color_button.dart';
import 'package:app2/components/restaurant_section.dart';
import 'package:app2/components/theme_button.dart';
import 'package:app2/models/color_selection.dart';
import 'package:app2/models/food_category.dart';
import 'package:app2/models/restaurant.dart';
import 'package:app2/pages/explore_page.dart';
import 'package:flutter/material.dart';

import 'models/food_category.dart';
import 'models/restaurant.dart';

class Home extends StatefulWidget {
  final ColorSelection colorSelection;
  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColor;
  final String title;

  Home(
      {required this.colorSelection,
      required this.changeTheme,
      required this.changeColor,
      required this.title,
      super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;

  List<NavigationDestination> appDestinations = const [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      label: "Home",
      selectedIcon: Icon(Icons.home),
    ),
    NavigationDestination(
      icon: Icon(Icons.list_outlined),
      label: "Pedidos",
      selectedIcon: Icon(Icons.list),
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outlined),
      label: "Conta",
      selectedIcon: Icon(Icons.person),
    )
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      //ExplorerPage
      ExplorePage(),
      Center(
        child: Text(
          "Pedidos",
          style: Theme
              .of(context)
              .textTheme
              .headlineLarge,
        ),
      ),
      Center(
        child: Text(
          "Conta",
          style: Theme
              .of(context)
              .textTheme
              .headlineLarge,
        ),
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 4,
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .surface,
        actions: [
          //ColorButton
          ColorButton(
              changeColor: (color) => widget.changeColor.call(color),
              colorSelection: widget.colorSelection),
          //ThemeButton
          ThemeButton(changeTheme: widget.changeTheme)
        ],
      ),
      body: IndexedStack(
        index: tab,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        destinations: appDestinations,
        selectedIndex: tab,
        onDestinationSelected: (indexSelected) {
          setState(() {
            tab = indexSelected;
          });
        },
      ),
    );
  }

  @override
  Widget build (BuildContext context){
    return FutureBuilder(
        future: mockService.getExploreData(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done) {
            final restaurants = snapshot.data?.restaurant ?? [];
            final categories = snapshot.data?.categories ?? [];
            final posts = snapshot.data?.friendsPosts ?? [];
            return ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                RestaurantSection(restaurants: restaurants),

              ],
            );
            }else {
            return const Center(
              child: CircularProgressIndicator(),
            );
            }
          }
  }

}


